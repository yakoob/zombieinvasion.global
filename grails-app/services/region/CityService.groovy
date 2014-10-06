package region

import grails.transaction.Transactional
import groovy.util.logging.Log4j
import ip.IpAddress

@Transactional
@Log4j
class CityService {

    def save(IpAddress ipAddress) {

        def city = City.findOrCreateByCityAndCountryCode(ipAddress.city, ipAddress.countryCode)
        city.properties = ipAddress.properties
        city.save(failOnError: true)
        return city

    }

    def findByIpAddress(IpAddress ipAddress){
        return save(ipAddress)
    }

}
