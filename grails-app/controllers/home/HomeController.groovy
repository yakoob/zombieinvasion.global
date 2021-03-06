package home

import blog.BlogEntry
import groovy.util.logging.Log4j
import region.City
import user.User

@Log4j
class HomeController {

    // todo : quotes - http://www.brainyquote.com/quotes/keywords/zombies.html

    def springSecurityService

    def index() {

        def askForEmail = false

        if(!params.offset)
            params.offset = 0

        if(!params.max)
            params.max = 10

        if (springSecurityService.isLoggedIn()){
            User user = springSecurityService.isLoggedIn() ? springSecurityService.loadCurrentUser() : null
            if (!user.email)
                askForEmail=true
        }


        def cityParams = params.clone()
        cityParams.max = 100

        render view: "index", model: [blogsCount:BlogEntry.count, blogs:BlogEntry.orderByLikesCount(params.max, params.offset), cities: City.list(cityParams), cityCount:City.count, askForEmail:askForEmail, hasStory:BlogEntry.findByAuthor(springSecurityService.currentUser)?true:false]

    }

    def about(){
        render view: "/home/about"
    }

    def contestSamsung(){

    }

    def contestXm193(){

    }
}
