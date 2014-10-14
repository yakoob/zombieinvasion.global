package test

import org.springframework.messaging.handler.annotation.MessageMapping
import org.springframework.messaging.handler.annotation.SendTo

class TestController {

    def index() {}

    @MessageMapping("/hello")
    @SendTo("/topic/hello")
    protected String hello(String world) {
        println world
        return "hello from controller, ${world}!"
    }



}
