package account

import blog.BlogEntry
import grails.plugin.springwebsocket.ConfigUtils
import groovy.util.logging.Log4j
import org.springframework.http.HttpStatus
import region.UndeadSighting

import user.User

@Log4j
class AccountController {

    def config = ConfigUtils.springWebsocketConfig
    def springSecurityService
    def undeadService

    def index() {

        if (springSecurityService.loggedIn) {
            User user = User.get(springSecurityService.principal.id)
            undeadService.track(user?.twitterUser)
            def lastSighting = UndeadSighting.findAllByUser(user.twitterUser)?.first()
            render (view:"/account/index", model: [sighting:lastSighting, undeadStories:BlogEntry.findAllByAuthor(user), otherSightings:UndeadSighting.findAllByUser(user?.twitterUser)])
        }

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
            render (view:"/account/show", model: [sighting:us, undeadStories:BlogEntry.findAllByAuthor(us?.user?.user), otherSightings:UndeadSighting.findAllByUser(us?.user)])
        else
            render status: HttpStatus.NO_CONTENT, text: HttpStatus.NO_CONTENT.name()

    }

}
