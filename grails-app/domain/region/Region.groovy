package region

class Region {

    String description

    String regionCode

    Boolean uiEnabled

    Country country

    static mapping = {
        dynamicUpdate true
        version false
    }

    static constraints = {
        description nullable: true
        regionCode nullable: true
        uiEnabled nullable: true
        country nullable: true
    }
}
