package actor


import akka.actor.ActorRef
import akka.actor.Props
import grails.util.Holders


trait ActorMaker {

    def akkaService = Holders.applicationContext.getBean("akkaService")

    public ActorRef makeZombieActor(String name){

        return akkaService.system.actorOf(Props.create(ZombieActor.class, name), "zombie-${name}");

    }


}