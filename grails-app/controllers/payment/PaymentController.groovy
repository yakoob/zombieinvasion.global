package payment

import groovy.util.logging.Log4j
import message.IncreaseScore
import org.joda.time.DateTime
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
        paymentLog.amount = ipn.payment_gross.toBigDecimal()
        paymentLog.date = DateTime.now().toDate()
        paymentLog.user = user
        paymentLog.log = ipn.toString()
        paymentLog.save()

        println(ipn)

        if (user)
            zombieManagerService.actorRef.tell(new IncreaseScore(points: paymentPoints(paymentLog.amount), name: user.username), akkaService.actorNoSender())

        render status: HttpStatus.OK
    }

    def paymentPoints(BigDecimal amount){

        def points = 10

        switch ( amount.toInteger() ) {

            case 0..9:
                points = 50
                break
            case 10..24:
                points = 100
                break
            case 25..49:
                points = 300
                break
            case 50..99:
                points = 500
                break
            case 100..499:
                points = 1000
                break
            case 500..10000:
                points = 50000
                break

        }

        return points
    }

}
