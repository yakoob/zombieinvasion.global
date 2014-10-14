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
    ActorRef mediator

    public static DateTime LAST_HEARTBEAT = DateTime.now()

    def init() {

        if (!akkaService.system){
            akkaService.init()
        }

        createActors()

        ActorRef mediator = DistributedPubSubExtension.get(akkaService.system).mediator()

        LAST_HEARTBEAT = DateTime.now()

    }

    def destroy(){
        akkaService.destroy()
    }

    def createActors() {
        zombieManagerService.setActorRef(akkaService.actorNoSender())
    }


}
