package audio

import grails.transaction.Transactional
import grails.util.Holders
import groovy.util.logging.Log4j
import org.codehaus.groovy.grails.test.support.GrailsTestAutowirer
import org.springframework.context.ApplicationContext
import spock.lang.*

@Log4j
@Stepwise
class AudioBinarySpec extends Specification {


    @Shared private ApplicationContext applicationContext = Holders.getApplicationContext()
    @Shared private GrailsTestAutowirer autowirer = new GrailsTestAutowirer(applicationContext)

    static transactional = false

    def setup() {
        autowirer.autowire(this)
    }

    def cleanup() {
    }

    void "test something"() {

        def audio = new AudioBinary(description: "Ministry - The Land Of Rape And Honey - Flashback").save(flush: true)

        when: 'saving a new audio'
        audio

        then: 'print the description'
        log.info(audio.description)


    }
}
