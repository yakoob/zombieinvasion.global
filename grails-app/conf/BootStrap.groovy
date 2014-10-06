import javax.servlet.ServletContext
import grails.plugin.springsecurity.SecurityFilterPosition
import grails.plugin.springsecurity.SpringSecurityUtils

class BootStrap {

    def appService

    def init = { ServletContext sc ->

        // SpringSecurityUtils.clientRegisterFilter('apiAuthFilter', SecurityFilterPosition.LAST.order + 10)

        appService.init()

    }

    def destroy = {
    }

}
