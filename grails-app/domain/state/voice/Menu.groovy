package state.voice

class Menu extends Voice implements utils.traits.Greeting, utils.traits.KeyPad {

    Voice.TypeCode getTypeCode() {
        return Voice.TypeCode.MENU
    }

    static mapping = {
        greeting lazy: false
    }

}
