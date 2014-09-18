package state

class Menu extends Voice implements utils.traits.Greeting, utils.traits.Menu {

    Voice.TypeCode getTypeCode() {
        return Voice.TypeCode.MENU
    }

    static mapping = {
        greeting lazy: false
    }

}
