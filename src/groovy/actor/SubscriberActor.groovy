package actor

import akka.actor.ActorRef
import akka.contrib.pattern.DistributedPubSubExtension
import akka.contrib.pattern.DistributedPubSubMediator
import akka.event.Logging
import akka.event.LoggingAdapter
import grails.util.Holders

class SubscriberActor extends BaseActor {

    def akkaService = Holders.applicationContext.getBean("akkaService")

    def brokerMessagingTemplate = Holders.applicationContext.getBean("brokerMessagingTemplate")

    LoggingAdapter log = Logging.getLogger(getContext().system(), this);

    ActorRef mediator = DistributedPubSubExtension.get(getContext().system()).mediator();

    String topic

    public SubscriberActor(String topic) {
        this.topic = topic
        mediator.tell(new DistributedPubSubMediator.Subscribe(topic, getSelf()), getSelf());
    }

    def unSubscribe(){
        mediator.tell(new DistributedPubSubMediator.Unsubscribe(this.topic, getSelf()), getSelf());
    }

    @Override
    void onReceive(Object msg) {
        if (msg instanceof String)
            log.info("Got: {}", msg);
        else if (msg instanceof DistributedPubSubMediator.SubscribeAck)
            log.info("subscribing");
        else
            unhandled(msg);
    }

}