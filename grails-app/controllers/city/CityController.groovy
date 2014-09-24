package city

import region.City

class CityController {

    def index() {}

    def stats(){
        render (view: "/city/stats")
    }

    def list(){
        [cities: City.list(params), cityCount:City.count]
    }

}
