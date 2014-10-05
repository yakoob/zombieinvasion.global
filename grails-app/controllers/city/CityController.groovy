package city

import region.City

class CityController {

    def index() {
        render view:"index", model:[total:City.count, contents: City.list(params)]
    }

    def stats(){
        render (view: "/city/stats")
    }

    def list(){
        render view:"index", model:[total:City.count, contents: City.list(params)]
    }

}
