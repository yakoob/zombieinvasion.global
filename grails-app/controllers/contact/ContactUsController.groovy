package contact

import grails.plugin.springsecurity.annotation.Secured
import mail.CheckMX

@Secured("permitAll")
class ContactUsController {


    def simpleCaptchaService
    def contactUsService
    def mailService
    def springSecurityService

    def index() {

        def user = springSecurityService.currentUser
        def usersemail=user?.email

        render (view: "/contact/index", model:[contactUs: new ContactUs(params), user:user,   usersemail:usersemail])


    }

    def emailBody() { }

    def send = { ContactUsVerify contactUs ->
        def user, usersemail
        Boolean captchaValid = 0
        if (session.SPRING_SECURITY_CONTEXT?.authentication?.authenticated!=null) {
            captchaValid = 1
            user = springSecurityService.currentUser
            usersemail=user?.email
        }else{
            captchaValid = simpleCaptchaService.validateCaptcha(params.captcha)
        }

        if(!captchaValid) {
            contactUs.errors.rejectValue('captcha', null, "Invalid Captcha Response")
        }

        if (captchaValid && !contactUs.hasErrors() ) {
            try {

                sendMail {
                    def admingroup=grailsApplication.config.contactus.admingroup
                    if (admingroup) {
                        def emails=contactUsService.getAdminEmail(admingroup)
                        if (!emails) {
                            def sendto=grailsApplication.config.contactus.to.address
                            if (sendto) {
                                to sendto
                                log.info ("contactUs Email: Individual Email being sent to: ${sendto}")
                            }
                        }else{
                            def primary=[]
                            emails.each {
                                primary.add(it)
                            }
                            log.info ("contactUs Email: Group Email being sent to: "+primary)
                            to primary
                        }
                    }else{
                        def sendto=grailsApplication.config.contactus.to.address
                        if (sendto) {
                            to sendto
                            log.info ("contactUs Email: Individual Email being sent to: ${sendto}")
                        }
                    }

                    from contactUs.email
                    subject "${(grailsApplication.config.contactus.subject.prefix ?: "Contact Me:")} ${contactUs.subject}"
                    body( view: "/contact/emailBody", model:[contactUs:contactUs])
                }

                def domainClass = new ContactUs()
                domainClass.properties = params
                domainClass.save(failOnError: true, flush: true)
                render( view: "/contact/thanks", model: [contactUs: contactUs])
                return
            } catch (Exception e) {
                log.info e.printStackTrace()
            }
        }
        flash.error = message(code:'it.id10t.contact.badCaptcha', args:params.captcha)
        flash.chainedParams = params
        render( view: "/contact/index", model: [contactUs: contactUs, user:user, usersemail:usersemail])
        return
    }

    // EmailValidator
    static final EmailValidator = { String email, command ->
        // Check out mx records of given email address - if not valid do not proceed
        def emaildomain=email.substring(email.indexOf('@')+1, email.length())
        CheckMX cm=new CheckMX()
        int hasMx=cm.doLookup(emaildomain)
        if (hasMx==0) {
            return 'contactUs.email.mx'
        }
    }
}
