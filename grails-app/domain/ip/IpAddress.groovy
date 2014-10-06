package ip

import groovy.transform.ToString

@ToString
class IpAddress {

    String ip
    Boolean anonymousProxy = false
    Double proxyScore = new Double(0)
    Boolean transProxy = false
    Boolean ipCorporateProxy = false

    String countryCode
    String regionCode
    String city
    String isp
    String organization
    Float latitude
    Float longitude
    String timeZone
    Long version = 1L

    static mapping = {
        dynamicUpdate true
        version false
    }

    static constraints = {
        ip nullable: false, unique: true
        countryCode nullable: true
        regionCode nullable: true
        city nullable: true
        isp nullable: true
        organization nullable: true
        latitude nullable: true
        longitude nullable: true
        timeZone nullable: true
    }


}
