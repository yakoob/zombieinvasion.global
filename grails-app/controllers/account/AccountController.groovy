package account

import blog.BlogEntry
import grails.plugin.springwebsocket.ConfigUtils
import groovy.util.logging.Log4j
import org.springframework.http.HttpStatus
import org.springframework.messaging.simp.config.MessageBrokerRegistry
import region.UndeadSighting
import user.TwitterUser
import user.User

@Log4j
class AccountController {

    def config = ConfigUtils.springWebsocketConfig
    def springSecurityService
    def undeadService

    def index() {


    }

    def login(){
        render (view: "/account/login")
    }

    def register(){
        render (view: "/account/register")
    }

    def oauthTwitter(){
        log.info(params)
        render "hello"
    }

    def show(){

        def id = params.id
        def us = UndeadSighting.findById(id)

        if (us)
            render (view:"/account/show", model: [sighting:us, undeadStories:BlogEntry.findByAuthor(us?.user?.user)])
        else
            render status: HttpStatus.NO_CONTENT, text: HttpStatus.NO_CONTENT.name()

    }

}
