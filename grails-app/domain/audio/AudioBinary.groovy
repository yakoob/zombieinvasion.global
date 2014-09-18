package audio

class AudioBinary extends Audio {

    byte[] fileBinary

    static mapping = {
        fileBinary sqlType: "longblob"
    }

}
