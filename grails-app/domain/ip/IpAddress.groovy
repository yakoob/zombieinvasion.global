package ip

import groovy.transform.ToString

@ToString
class IpAddress {

    String ip
    Boolean anonymousProxy
    Double proxyScore
    Boolean transProxy
    Boolean ipCorporateProxy

    String countryCode
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
        city nullable: true
        isp nullable: true
        organization nullable: true
        latitude nullable: true
        longitude nullable: true
        timeZone nullable: true
    }


}
