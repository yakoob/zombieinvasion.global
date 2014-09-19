package home

import groovy.util.logging.Log4j
import region.Country

@Log4j
class HomeController {

    def blogService
    def imageService

    def index() {
        render view: "index", model: [blogs:blogService.findBlogs()]
    }
}
