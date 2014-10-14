package test

import org.springframework.messaging.handler.annotation.MessageMapping
import org.springframework.messaging.handler.annotation.SendTo

class TestController {
    // TODO: http://www.theotherian.com/2014/03/spring-boot-websockets-stomp-chat.html
    def index() {}

    @MessageMapping("/hello")
    @SendTo("/topic/hello")
    protected String hello(String world) {
        println world
        return "hello from controller, ${world}!"
    }



}
