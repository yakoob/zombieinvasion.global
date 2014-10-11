package map

import region.UndeadSighting

class MapController {

    def index(){

        // todo add map clusters
        def undeadSightings = UndeadSighting.all

        render view: "index", model: [undeadSightings:undeadSightings]

    }
}
