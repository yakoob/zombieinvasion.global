package ip

import grails.transaction.Transactional
import groovy.util.logging.Log4j
import org.codehaus.groovy.grails.validation.routines.InetAddressValidator
import org.codehaus.groovy.grails.web.util.WebUtils
import org.springframework.web.context.request.RequestContextHolder
import org.springframework.web.context.request.ServletRequestAttributes


@Transactional
@Log4j
class IpAddressService {

    def geoIPLegacyService

    def cityService

    def getIpAddress() {

        def request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest()

        def ipAddress = request.getHeader('X-Real-IP')

        if (!ipAddress)
            ipAddress = request.getHeader('Client-IP')

        if (!ipAddress)
            ipAddress = request.getHeader('X-Forwarded-For')

        if (!ipAddress)
            ipAddress = request.remoteAddr

        log.info(ipAddress)

        return ipAddress
    }

    /**
     * Gets information about the ip from MaxMind DAT files and MaxMind Web API.
     * Information from MaxMind Web API is cached in our database for 180 days and reused in subsequent calls.
     */
    IpAddress get() {
        def i = ipAddress

        try {
            if (!isValidIp(i))
                i = whatsMyIp()
        } catch(e){
            log.error(e.message)
        }

        log.info(i)

        return get(i)

    }

    public IpAddress get(String ip) {

        IpAddress ipAddress = null

        try {

            ipAddress = IpAddress.findOrCreateByIp(ip)

            GeoIPLegacyInfo geoIPLegacyInfo = geoIPLegacyService.get(ipAddress.ip)

            if(geoIPLegacyInfo)
                ipAddress.properties = geoIPLegacyInfo.properties

            ipAddress.save(failOnError: true)

            cityService.save(ipAddress)
        } catch (e){
            log.error(e)
        }

        return ipAddress

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


}