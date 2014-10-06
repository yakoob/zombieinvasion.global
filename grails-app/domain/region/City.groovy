package region

class City {

    String city
    String countryCode
    String regionCode
    Integer populationInfected = 0
    String timeZone

    static hasMany = [undeadSightings: UndeadSighting]

    def getCountry(){
        if (this.countryCode)
            return Country.findByCountryCode(this.countryCode)
        return null
    }

    static mapping = {
        dynamicUpdate true
        version false
    }

    static constraints = {
        timeZone nullable: true
        regionCode nullable: true
        undeadSightings nullable: true
    }

    def defaults(){
        if (!this.populationInfected){
            this.populationInfected = 0
        }
    }

    def beforeUpdate(){
        defaults()
    }

    def beforeInsert(){
        defaults()
    }

}
