package tracking

import grails.transaction.Transactional
import org.joda.time.DateTime
import region.UndeadSighting
import user.TwitterUser
import user.User

@Transactional
class UndeadService {

    def ipAddressService
    def cityService


    def track(String token) {
        track(TwitterUser.findByToken(token))
    }

    def track(TwitterUser twitterUser) {

        def ipAddress = ipAddressService.get()
        def city = cityService.findByIpAddress(ipAddress)

        if (!UndeadSighting.findByCityAndUser(city, twitterUser))
            city.populationInfected = city.populationInfected + 1

        twitterUser.addToIps(ipAddress)
        twitterUser.addToCities(city)

        UndeadSighting undeadSighting = UndeadSighting.findOrCreateByCityAndLongitudeAndLatitudeAndUser(city, ipAddress.longitude, ipAddress.latitude, twitterUser)
        undeadSighting.lastUpdated = DateTime.now().toDate()

        city.addToUndeadSightings(undeadSighting)

    }


}
