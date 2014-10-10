
package actor

import akka.actor.ActorPath
import akka.actor.Props
import akka.event.Logging
import akka.event.LoggingAdapter
import grails.util.Holders
import message.Message
import message.SpawnZombie
import org.codehaus.groovy.grails.web.context.ServletContextHolder
import org.codehaus.groovy.grails.web.servlet.GrailsApplicationAttributes

class ZombieManager extends BaseActor implements ActorMaker {

    def akkaService = Holders.applicationContext.getBean("akkaService")

    def ctx = ServletContextHolder.servletContext.getAttribute(GrailsApplicationAttributes.APPLICATION_CONTEXT)

    LoggingAdapter log = Logging.getLogger(getContext().system(), this)

    public ZombieManager() {
        log.info("ZombieManager() Initialized")
    }

    @Override
    void onReceive(Object message) throws Exception {

        if (message instanceof Message) {

            log.info(message.name.toString())

            Boolean hasChild = getContext().getChild("zombie-${message.name.toString()}")?true:false

            log.info(hasChild.toString())

            if (!hasChild)
                context.actorOf(Props.create(ZombieActor.class, message.name), "zombie-${message.name.toString()}").tell(message, context.self())
            else
                context.system().actorSelection("/user/ZombieManager/zombie-${message.name}").tell(message, context.self())

        } else {

            log.error "ZombieManager: message not handled, message: ${message.toString()}"

        }


    }

}