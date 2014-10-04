class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }
        "/register"(controller: "account", action: "register")
        "/login"(controller: "account", action: "login")
        "/city"(controller: "city", action: "index")
        "/city/$id"(controller: "city", action: "index")
        "/blogs/$id"(controller: "blog", action: "show")
        "/comment/$blogId"(controller: "blog", action: "comment")
        "/like/$id"(controller: "blog") {
            action = [POST: "like"]
        }
        "/oauth/twitter/callback"(controller: "account", action: "oauthTwitter")
        "/"(controller: "home", action: "index")
        "500"(view:'/error')
    }
}