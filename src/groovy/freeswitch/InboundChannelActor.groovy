package freeswitch

import actor.BaseActor
import event.Hungup
import event.KeyPressed
import event.Parked
import grails.util.Holders
import message.*
import state.All
import state.voice.Greeting
import state.call.InboundChannelState
import state.Init
import state.voice.Menu
import state.None
import utils.traits.ObjectBinding

class InboundChannelActor extends BaseActor implements ObjectBinding, InboundChannelState {

    def akkaService = Holders.applicationContext.getBean("akkaService")
    def audioActorService = Holders.applicationContext.getBean("audioActorService")
    def speechActorService = Holders.applicationContext.getBean("speechActorService")
    def freeSwitchActorService = Holders.applicationContext.getBean("freeSwitchActorService")

    public InboundChannelActor(String channelUuid, String destination) {

        this.channelUuid = channelUuid
        this.destination = destination

        // record a transition for Event: "Parked and All" from State: "None" to State: "Greeting"
        state_ChannelState__fsm.record().on([Parked]).from(None).to(None).act = {

            log.info("on Parked from None -> None")
            state_ChannelState__fsm.goToState(state_ChannelState__fsm.currentValue)

        }

        // Initialize a Greeting
        state_ChannelState__fsm.record().on([Init]).from(Greeting).to(Greeting).act = { event ->
            // play greeting
            audioActorService.actorRef.tell(new Shout(channelUuid: channelUuid, audioId: state_ChannelState__fsm.currentValue.greeting.id), context.self())
        }

        // Play a menu Greeting
        state_ChannelState__fsm.record().on([Init]).from(Menu).to(Menu).act = { event ->
            // play menu greeting
            audioActorService.actorRef.tell(new Shout(channelUuid: channelUuid, audioId: state_ChannelState__fsm.currentValue.greeting.id), akkaService.actorNoSender())
        }

        // Wait for menu events or other state events
        state_ChannelState__fsm.record().on([KeyPressed]).from(Menu).to(Menu).act = { event ->
            speechActorService.actorRef.tell(new Speak(channelUuid: channelUuid, words: "dtmf ${event.digit}"), akkaService.actorNoSender())
        }

        state_ChannelState__fsm.record().on([Hungup]).from(All).to(All).act = { event ->
            context.stop(context.self())
        }

    }

    @Override
    void onReceive(Object message) throws Exception {


        if (message instanceof Parked && !message.variableActor && message.inbound) {
            freeSwitchActorService.actorRef.tell(copyObject(message, new SetVar(key: "actor", value: self.path().toString())), context.self())
            freeSwitchActorService.actorRef.tell(copyObject(message, new Answer()), context.self())
        }

        state_ChannelState__fsm.fire(message, state_ChannelState__fsm.currentState)

    }


}
