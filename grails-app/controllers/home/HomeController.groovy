package home

import blog.BlogEntry
import groovy.util.logging.Log4j
import region.City
import region.Country
import user.User

@Log4j
class HomeController {

    // todo : quotes - http://www.brainyquote.com/quotes/keywords/zombies.html

    def springSecurityService
    def blogService

    def index() {

        def askForEmail = false

        if(!params.offset)
            params.offset = 0

        if(!params.max)
            params.max = 30

        params.sort = "population"
        params.order = "desc"

        if (springSecurityService.isLoggedIn()){
            User user = springSecurityService.isLoggedIn() ? springSecurityService.loadCurrentUser() : null
            if (!user.email)
                askForEmail=true

        }

        render view: "index", model: [blogs:blogService.findBlogs(), cities: City.list(params), cityCount:City.count, askForEmail:askForEmail, hasStory:BlogEntry.findByAuthor(springSecurityService.currentUser)?true:false]

    }
}
