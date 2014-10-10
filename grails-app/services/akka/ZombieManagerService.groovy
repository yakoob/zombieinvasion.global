package akka

import actor.ZombieManager
import akka.actor.ActorRef
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ZombieManagerService {

    def akkaService

    ActorRef actorRef

    public void setActorRef(ActorRef ref){
        actorRef = akkaService.actorOf(ZombieManager, "ZombieManager")
    }

    public ActorRef getActorRef() {
        return actorRef
    }

}
