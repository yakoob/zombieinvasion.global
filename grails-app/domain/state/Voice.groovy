package state

import account.Account


class Voice {

    enum TypeCode {
        GREETING, MENU
    }

    TypeCode typeCode = TypeCode.GREETING
    String description
    Account account

    static mapping = {
        typeCode enumType: 'string'
        tablePerHierarchy false
        account lazy: false
    }

    static constraints = {
        description nullable: true
        account nullable: true
    }

    def beforeInsert() {
        throw RuntimeException("You must get written permission!!!")
    }

    def beforeDelete() {
        throw RuntimeException("You must get written permission!!!")
    }

    def beforeUpdate(){
        throw RuntimeException("You must get written permission!!!")
    }
}
