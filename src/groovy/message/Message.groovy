package message

import groovy.util.logging.Log4j

@Log4j
class Message implements Serializable {
    String name
    String actorPath

}
