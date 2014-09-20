package ip

import grails.transaction.Transactional
import org.codehaus.groovy.grails.validation.routines.InetAddressValidator
import org.codehaus.groovy.grails.web.util.WebUtils

@Transactional
class IpAddressService {

    def geoIPLegacyService

    /**
     * Gets information about the ip from MaxMind DAT files and MaxMind Web API.
     * Information from MaxMind Web API is cached in our database for 180 days and reused in subsequent calls.
     */
    IpAddress processIP(String ip) {
        get(ip)
    }

    public IpAddress get(String ip) {

        IpAddress ipAddress = IpAddress.findOrCreateByIp(ip)

        GeoIPLegacyInfo geoIPLegacyInfo = geoIPLegacyService.get(ipAddress.ip)

        if(geoIPLegacyInfo)
            ipAddress.properties = geoIPLegacyInfo.properties

        ipAddress.save()
    }

    public IpAddress getCached(String ip) {

        IpAddress ipAddress = IpAddress.get(ip)

        GeoIPLegacyInfo geoIPLegacyInfo = geoIPLegacyService.get(ipAddress.ip)

        if(geoIPLegacyInfo)
            ipAddress.properties = geoIPLegacyInfo.properties

        ipAddress.save()
    }

    def whatsMyIp() {
        def currentIp = ("http://whatsmyip.us/".toURL().text =~ /\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b/)[0]
        return currentIp
    }

    def isValidIp(String ip) {
        if (ip == "127.0.0.1")
            return false
        if (ip.substring(0,3) == "10." )
            return false

        return InetAddressValidator.getInstance().isValidInet4Address(ip)
    }

    def getClientIp() {
        def request = WebUtils.retrieveGrailsWebRequest().getCurrentRequest();
        return request.getRemoteAddr()
    }

    //TODO: check if get can be used instead of this.
    def processOffline(i) {

        try {
            if (!isValidIp(i))
                i = whatsMyIp()
        } catch(e){
            log.error(e.message)
        }

        def ip = IpAddress.findByIp(i)

        if (!ip)
            ip = get(i)

        ip.properties = geoIPLegacyService.get(ip.ip)?.properties
        if (ip.properties) {
            ip.version=ip.version+1
            ip.save(failOnError: true)
        }

        return ip
    }

    /**
     * this just looks at the X-Forwarded-For
     * so the assumption is any proxies
     * or load balancers must keep that consistent.
     *
     * WARNING: multiple X-Forwarded-For's may
     * be specified. also X-Forwarded-For may
     * be comma delimited list of addresses.
     * given those, it is absolutely imperative
     * that this server have a X-Forwarded-For
     * cleaning in front of it.
     *
     * @param request
     * @return
     */
    public String findIpAddressInRequest(request){
        return request.getHeader("X-Forwarded-For")
    }

}