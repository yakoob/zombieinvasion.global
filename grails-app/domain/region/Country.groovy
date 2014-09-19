package region

import grails.util.Holders

class Country {

    String countryCode
    String countryName
    Long populationCount
    Integer fraudRiskLevel
    byte[] flag


    static mapping = {
        flag sqlType: "longblob"
    }


    def beforeInsert() {
        throw RuntimeException("You must get written permission!!!")
    }

    def beforeDelete() {
        throw RuntimeException("You must get written permission!!!")
    }

    def static UPDATE_FLAGS() {

        def grailsApp = Holders.applicationContext.getBean("grailsApplication")

        def rootPath = grailsApp.config.file.image

        def flagUri = new File("${rootPath}/flags/none.jpg").toURI()

        def countries = this.findAll().each { country ->

            def file = new File("${rootPath}/flags/${country.countryCode}.png")

            if (file.exists()){
                flagUri = new File("${rootPath}/flags/${country.countryCode}.png").toURI()
            }

            if( flagUri ) {
                try {
                    country.flag = java.nio.file.Paths.get(flagUri).readBytes()
                    country.save()
                } catch (e){
                    log.error(e)
                }

            }

        }

    }

}
