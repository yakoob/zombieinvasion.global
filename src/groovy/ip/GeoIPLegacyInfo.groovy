package ip

import grails.validation.Validateable
import groovy.transform.TupleConstructor

@Validateable
@TupleConstructor
class GeoIPLegacyInfo {
    String ipAddress
    String countryCode
    String regionCode
    String city
    String isp
    String organization
    Float latitude
    Float longitude
    String timeZone

    static constraints  = {
        ipAddress nullable: true
        countryCode nullable: true
        regionCode nullable: true
        city nullable: true
        organization nullable: true
        latitude nullable: true
        longitude nullable: true
        timeZone nullable: true
        isp nullable: true
    }
}
