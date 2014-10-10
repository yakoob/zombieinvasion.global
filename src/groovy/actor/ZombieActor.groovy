package actor

import grails.util.Holders
import message.IncreaseScore
import message.SpawnZombie
import state.All
import user.TwitterUser
import utils.traits.ObjectBinding
import utils.traits.State

class ZombieActor extends BaseActor implements ObjectBinding, State {

    def akkaService = Holders.applicationContext.getBean("akkaService")
    def brokerMessagingTemplate = Holders.applicationContext.getBean("brokerMessagingTemplate")


    String name
    TwitterUser twitterUser

    public ZombieActor(String name) {

        log.info("zombie actor initialized")

        this.name = name
        this.twitterUser = TwitterUser.findByUsername(name)

        utils_traits_State__fsm.record().on([SpawnZombie]).from(All).to(All).act = { event ->

            log.info("ITS ALIVE")
            // utils_traits_State__fsm.goToState(utils_traits_State__fsm.currentValue)

        }

        utils_traits_State__fsm.record().on([IncreaseScore]).from(All).to(All).act = { event ->

            log.info("INCREASE ZOMBIE SCORE")
            // utils_traits_State__fsm.goToState(utils_traits_State__fsm.currentValue)
            twitterUser.score += event.points
            twitterUser.save()

            notifyJmsTopic(twitterUser)

        }

    }

    def notifyJmsTopic(TwitterUser twitterUser){

        String topic = "/topic/score/${twitterUser.username}"

        brokerMessagingTemplate.convertAndSend(topic, twitterUser.score)

    }

    @Override
    void onReceive(Object message) throws Exception {

        utils_traits_State__fsm.fire(message, utils_traits_State__fsm.currentState)

    }

}