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

    public ZombieActor(String name) {

        log.info("zombie actor initialized")

        this.name = name

        utils_traits_State__fsm.record().on([SpawnZombie]).from(All).to(All).act = { event ->

            log.info("ITS ALIVE - {$name}")
            // utils_traits_State__fsm.goToState(utils_traits_State__fsm.currentValue)

        }

        utils_traits_State__fsm.record().on([IncreaseScore]).from(All).to(All).act = { event ->

            log.info("INCREASE ZOMBIE SCORE - ${event.points} ${name}")

            // utils_traits_State__fsm.goToState(utils_traits_State__fsm.currentValue)
            def twitterUser = TwitterUser.findByUsername(name)
            twitterUser.score += event.points
            twitterUser.rank = currentStatus(twitterUser.score)
            twitterUser.save()

            notifyJmsTopic(twitterUser)

        }

    }

    public TwitterUser.Rank currentStatus(Long p){

        def points = p.toInteger()

        println points

        def status = TwitterUser.Rank.Noob

        switch ( points ) {

            case 50..99:
                status = TwitterUser.Rank.Viral_Zombie
                break
            case 100..299:
                status = TwitterUser.Rank.Zombie_King
                break
            case 300..499:
                status = TwitterUser.Rank.IScream_Zombie
                break
            case 500..999:
                status = TwitterUser.Rank.Blood_Zombie
                break
            case 1000..1999:
                status = TwitterUser.Rank.Zombie_Overlord
                break
            case 2000..49999:
                status = TwitterUser.Rank.Nuclear_Zombie
                break
            case 50000..900000:
                status = TwitterUser.Rank.VIZ_Nuclear_Zombie
                break

        }

        return status
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