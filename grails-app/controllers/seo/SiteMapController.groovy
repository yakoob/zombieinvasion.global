package seo

import grails.plugin.springsecurity.annotation.Secured
import blog.BlogEntry

class SiteMapController {

    @Secured("permitAll")
    def index() {
        render view: "/seo/siteMap", model: [blogs:BlogEntry.findAll()]
    }
}
