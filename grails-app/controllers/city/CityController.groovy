package city

import org.springframework.http.HttpStatus
import region.City
import region.UndeadSighting

class CityController {

    def index() {
        render view:"index", model:[total:City.count, contents: City.list(params)]
    }

    def show(){
        if (params.id) {
            def city = City.findById(params.id)
            render (view: "/city/show", model: [city:city, sightings: UndeadSighting.findAllByCity(city)])
        } else {
            respond status: HttpStatus.NO_CONTENT, text: HttpStatus.NO_CONTENT.name()
        }


    }

    def stats(){
        render (view: "/city/stats")
    }

    def list(){
        render view:"index", model:[total:City.count, contents: City.list(params)]
    }

}
