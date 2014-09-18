package contact

import grails.validation.Validateable

@Validateable
class ContactUsVerify {
    String name
    String email
    String username
    String subject
    String message
    String captcha
    static optionals = [ 'username' ]
    static mapping = {
        message type: 'text'
        username  defaultValue: ''
    }
    static constraints = {

        captcha(blank: true, nullable:true)
        name(blank: false)
        email(blank: false, email: true, validator: ContactUsController.EmailValidator)
        subject(blank: false)
        message(minSize: 10,blank: false)

    }


}

