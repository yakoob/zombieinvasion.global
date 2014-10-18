class UrlMappings {

    static mappings = {

        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/about"(controller: "home", action: "about")

        "/register"(controller: "account", action: "register")

        "/login"(controller: "account", action: "login")

        "/city"(controller: "city", action: "index")
        "/city/$id/sightings"(controller: "city", action: "show")


        "/blogs"(controller: "blog", action: "index")
        "/blogs/latest"(controller: "blog", action: "latest")
        "/blogs/$id"(controller: "blog", action: "show")
        "/blog/form"(controller: "blog", action: "blogForm")

        "/payment"(controller: "payment", action: "index")

        "/payment/paypal/ipn"(controller: "payment") {
            action = [POST: "ipnListener"]
        }

        "/comment/$blogId"(controller: "blog", action: "comment")

        "/like/$id"(controller: "blog") {
            action = [POST: "like"]
        }

        "/oauth/twitter/callback"(controller: "account", action: "oauthTwitter")

        "/zombie/$id"(controller: "account", action: "show")
        "/z/$id"(controller: "account", action: "zombie")

        "/sitemap"(controller: "siteMap", action: "index")

        "/contest/samsung/galaxy4/tab"(controller: "home", action: "contestSamsung")
        "/contest/xm193"(controller: "home", action: "contestXm193")

        "/"(controller: "home", action: "index")

        "500"(view:'/error')
    }
}