package ip

import com.maxmind.geoip.Location
import com.maxmind.geoip.LookupService
import groovy.util.logging.Log4j

import javax.annotation.PostConstruct
import javax.annotation.PreDestroy

import static com.maxmind.geoip.LookupService.GEOIP_MEMORY_CACHE

@Log4j
class GeoIPLegacyService {

    def timeZoneService
    def grailsApplication

    static transactional = false

    private LookupService locationLookupService, orgLookupService, ispLookupService

    @PostConstruct
    private void init() {
        //TODO do we want to change the caching strategy?
        locationLookupService = new LookupService(grailsApplication.config.maxMind.geoIpLegacy.cityFilePath as String, GEOIP_MEMORY_CACHE)
        ispLookupService = new LookupService(grailsApplication.config.maxMind.geoIpLegacy.ispFilePath as String, GEOIP_MEMORY_CACHE)
        orgLookupService = new LookupService(grailsApplication.config.maxMind.geoIpLegacy.orgFilePath as String, GEOIP_MEMORY_CACHE)
    }

    /**
     * Retrieves information regarding an IP from GeoIP databases
     */
    GeoIPLegacyInfo get(String ip) {
        try {
            Location location = locationLookupService.getLocation(ip)

            location = locationDefaults(location)

            // String timeZone =  timeZoneService.getTimeZoneByCountryAndRegion(location?.countryCode, location.region)
            GeoIPLegacyInfo geoIPLegacyInfo = new GeoIPLegacyInfo(ip, location.countryCode, location.region, location.city, ispLookupService.getOrg(ip), orgLookupService.getOrg(ip), location.latitude, location.longitude)

            log.info(geoIPLegacyInfo.regionCode)

            return geoIPLegacyInfo

        } catch (e) {

            log.error "Could not get info from Geo IP Legacy | Exception: " + e
            return null

        }
    }

    def locationDefaults(Location location){

        if (!location)
            location = new Location()

        if (!location.area_code)
            location.area_code = 0

        if (!location.city)
            location.city = "Unknown"

        if (!location.countryCode)
            location.countryCode = "A1"

        if (!location.latitude)
            location.latitude = 0.0

        if (!location.longitude)
            location.longitude = 0.0

        if (!location.region)
            location.region = "ZiG"

        return location

    }

    @PreDestroy
    private void cleanUp() {
        locationLookupService.close()
        orgLookupService.close()
        ispLookupService.close()
    }
}
