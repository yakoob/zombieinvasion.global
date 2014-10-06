package account

import user.User

class AccountController {

    def springSecurityService
    def ipAddressService

    def index() {

        if (springSecurityService.loggedIn) {

            def user = springSecurityService.loadCurrentUser()

            if (user){
                ipAddressService.get()
            }

        }

    }

    def login(){
        render (view: "/account/login")
    }

    def register(){
        render (view: "/account/register")
    }

    def oauthTwitter(){
        log.info(params)
        render "hello"
    }

}
