package payment

import groovy.util.logging.Log4j
import org.springframework.http.HttpStatus
import payment.paypal.Ipn
import user.User

@Log4j
class PaymentController  {

    def index() {


    }

    def ipnListener(){

        def ipn = new Ipn()

        bindData ipn, request

        println(ipn)

        def paymentLog = new PaymentLog()
        paymentLog.transactionId = ipn.txn_id
        paymentLog.status = ipn.payment_status
        paymentLog.amount = ipn.payment_gross
        paymentLog.date = ipn.payment_date
        paymentLog.user = User.findByUsername(ipn.custom)
        paymentLog.log = ipn.toString()
        paymentLog.save()

        render status: HttpStatus.OK
    }
}
