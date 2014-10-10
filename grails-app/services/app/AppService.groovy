package app

import grails.transaction.Transactional
import org.joda.time.DateTime

@Transactional
class AppService {

    def grailsApplication
    def akkaService
    def zombieManagerService

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
