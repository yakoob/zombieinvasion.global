package account

class AccountController {

    def index() {}

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
