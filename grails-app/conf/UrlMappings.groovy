class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }
        "/register"(controller: "account", action: "register")
        "/blogs/$id"(controller: "blog", action: "show")
        "/"(controller: "home", action: "index")
        "500"(view:'/error')
    }
}
// http://www.componentix.com/blog/2/twitter-and-google-maps-mashup-in-minutes-with-grails