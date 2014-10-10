package payment

import groovy.util.logging.Log4j
import message.IncreaseScore
import org.springframework.http.HttpStatus
import payment.paypal.Ipn
import user.User

@Log4j
class PaymentController  {
    def akkaService
    def zombieManagerService

    def index() {

    }

    def ipnListener(){

        def ipn = new Ipn()

        bindData ipn, request

        def user = User.findByUsername(ipn.custom)

        def paymentLog = new PaymentLog()
        paymentLog.transactionId = ipn.txn_id
        paymentLog.status = ipn.payment_status
        paymentLog.amount = ipn.payment_gross
        paymentLog.date = ipn.payment_date
        paymentLog.user = User.findByUsername(ipn.custom)
        paymentLog.log = ipn.toString()
        paymentLog.save()

        println(ipn)

        zombieManagerService.actorRef.tell(new IncreaseScore(points: 100, name: user.username), akkaService.actorNoSender())

        render status: HttpStatus.OK
    }
}
