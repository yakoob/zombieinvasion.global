package app

import akka.actor.ActorRef
import grails.transaction.Transactional
import org.joda.time.DateTime
import akka.contrib.pattern.DistributedPubSubExtension
@Transactional
class AppService {

    def grailsApplication
    def akkaService
    def zombieManagerService

    // http://eweise.com/articles/akka-cluster-example/
    // http://doc.akka.io/docs/akka/snapshot/contrib/distributed-pub-sub.html
    // http://www.theotherian.com/2014/03/spring-boot-websockets-stomp-chat.html

    public static DateTime LAST_HEARTBEAT = DateTime.now()

    def init() {

        if (!akkaService.system){
            akkaService.init()
        }

        createActors()

        LAST_HEARTBEAT = DateTime.now()

    }

    def destroy(){
        akkaService.destroy()
    }

    def createActors() {
        zombieManagerService.setActorRef(akkaService.actorNoSender())
    }


}
