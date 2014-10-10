package tracking

import grails.transaction.Transactional
import grails.util.Holders
import message.SpawnZombie
import org.joda.time.DateTime
import region.UndeadSighting
import user.TwitterUser

@Transactional
class UndeadService {

    def akkaService
    def ipAddressService
    def cityService
    def zombieManagerService
    // def rankingRulesEngineService

    def track(String token) {
        track(TwitterUser.findByToken(token))
    }

    def track(TwitterUser twitterUser) {

        try {
            def ipAddress = ipAddressService.get()

            if (ipAddress){

                def city = cityService.findByIpAddress(ipAddress)

                if (!UndeadSighting.findByCityAndUser(city, twitterUser))
                    city.populationInfected = city.populationInfected + 1

                twitterUser.addToIps(ipAddress)
                twitterUser.addToCities(city)

                UndeadSighting undeadSighting = UndeadSighting.findOrCreateByCityAndLongitudeAndLatitudeAndUser(city, ipAddress.longitude, ipAddress.latitude, twitterUser)
                undeadSighting.lastUpdated = DateTime.now().toDate()

                city.addToUndeadSightings(undeadSighting)

                zombieManagerService.actorRef.tell(new SpawnZombie(name: twitterUser.username), akkaService.actorNoSender())

            } else {
                log.error("ipAddressService.get() failed")
            }
        } catch (e){
            log.error(e.message)
        }


    }

}
