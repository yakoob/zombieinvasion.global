package audio

class AudioBinary extends Audio {

    byte[] fileBinary

    static constraints = {
        fileBinary nullable: true
    }

    static mapping = {
        fileBinary sqlType: "longblob"
    }

}
