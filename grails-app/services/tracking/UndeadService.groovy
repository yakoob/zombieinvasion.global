package tracking

import grails.transaction.Transactional
import grails.util.Holders
import region.UndeadSighting
import user.TwitterUser

@Transactional
class UndeadService {

    def ipAddressService
    def cityService


    def track(TwitterUser twitterUser) {

        println "track"

        def ipAddress = ipAddressService.get()
        def city = cityService.findByIpAddress(ipAddress)

        twitterUser.addToIps(ipAddress)
        twitterUser.addToCities(city)

        UndeadSighting undeadSighting = new UndeadSighting(city: city, longitude: ipAddress.longitude, latitude: ipAddress.latitude, user: twitterUser)
        city.addToUndeadSightings(undeadSighting)
        

    }


}
