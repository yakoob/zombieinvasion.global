package utils.traits

import groovy.util.logging.Log4j
import state.FiniteStateMachine
import state.None

@Log4j
trait State {

    public FiniteStateMachine fsm = FiniteStateMachine.newInstance(None)


}