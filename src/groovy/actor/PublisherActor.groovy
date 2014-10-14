package actor

import akka.actor.ActorRef
import akka.contrib.pattern.DistributedPubSubExtension
import akka.contrib.pattern.DistributedPubSubMediator
import akka.event.Logging
import akka.event.LoggingAdapter
import grails.util.Holders
import org.aspectj.asm.HierarchyWalker

/**
 * Usage:
 *
 * It can publish messages to the topic from anywhere in the cluster:
 * // somewhere else
 * // ActorRef publisher = system.actorOf(Props.create(Publisher.class), "publisher");
 * // after a while the subscriptions are replicated
 * publisher.tell("hello", null);
 *
 */
class PublisherActor extends BaseActor {

    def akkaService = Holders.applicationContext.getBean("akkaService")

    def brokerMessagingTemplate = Holders.applicationContext.getBean("brokerMessagingTemplate")

    LoggingAdapter log = Logging.getLogger(getContext().system(), this);

    ActorRef mediator = DistributedPubSubExtension.get(getContext().system()).mediator();

    String topic

    // http://doc.akka.io/docs/akka/snapshot/contrib/distributed-pub-sub.html
    public PublisherActor(String topic) {
        this.topic = topic
    }

    public void onReceive(Object msg) {

        // tell mediator to tell other mediators on the network with this topic about this message
        mediator.tell(new DistributedPubSubMediator.Publish(this.topic, msg), getSelf());

        // tell JSM to tell WebSockets of this topics message
        brokerMessagingTemplate.convertAndSend("/topic/${this.topic}", msg)
    }

}