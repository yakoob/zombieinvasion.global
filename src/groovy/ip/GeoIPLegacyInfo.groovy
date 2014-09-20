package ip

import grails.validation.Validateable
import groovy.transform.TupleConstructor

@Validateable
@TupleConstructor
class GeoIPLegacyInfo {
    String ipAddress
    String countryCodeIso
    String countryRegionCode
    String city
    String isp
    String organization
    Float latitude
    Float longitude
    String timeZone

    static constraints  = {
        ipAddress nullable: true
        countryCodeIso nullable: true
        countryRegionCode nullable: true
        city nullable: true
        organization nullable: true
        latitude nullable: true
        longitude nullable: true
        timeZone nullable: true
    }
}
