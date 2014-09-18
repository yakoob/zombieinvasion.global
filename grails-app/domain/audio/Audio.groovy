package audio

class Audio {

    String description

    static mapping = {
        tablePerHierarchy false
    }

    static constraints = {
        description nullable: true
    }

    def beforeDelete() {
        throw RuntimeException("You must get written permission!!!")
    }

    def beforeUpdate(){
        throw RuntimeException("You must get written permission!!!")
    }

}
