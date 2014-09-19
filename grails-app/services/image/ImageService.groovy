package image

import grails.transaction.Transactional
import grails.util.Holders
import region.Country


@Transactional
class ImageService {

    def grailsApp = Holders.applicationContext.getBean("grailsApplication")

    def prepare() {

        def rootPath = grailsApp.config.file.image

        def countries = Country.findAll().each { country ->

            def flagUri = new File("${rootPath}/flags/${country.countryCode}.png").toURI()

            log.info(flagUri)

            if( flagUri ) {
                try {
                    country.flag = java.nio.file.Paths.get(flagUri).readBytes()
                    log.info(country.flag)
                    country.save()
                } catch (e){
                    log.error(e.cause)
                    log.error(e.message)
                }

            }

        }

    }



}
