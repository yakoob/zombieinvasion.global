package security

import com.the6hours.grails.springsecurity.twitter.TwitterAuthToken
import grails.util.Holders
import groovy.util.logging.Log4j
import org.springframework.context.ApplicationListener
import org.springframework.security.authentication.event.AuthenticationSuccessEvent

@Log4j
class SecurityEventListener implements ApplicationListener<AuthenticationSuccessEvent> {

    void onApplicationEvent(AuthenticationSuccessEvent event) {

        if (event.source instanceof TwitterAuthToken) {
            def undeadService = Holders.applicationContext.getBean("undeadService")
            undeadService.track(event.source.token)
        } else {
            log.info("not a twitter auth success")
        }

    }
}
