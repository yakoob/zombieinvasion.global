package payment

import user.User

class PaymentLog {
    String transactionId
    String status
    BigDecimal amount
    Date date
    String log
    User user

    static mapping = {
        dynamicUpdate true
        version false
    }

    static constraints = {

        transactionId nullable: true
        amount nullable: true
        date nullable: true
        log nullable: true
        user nullable: true

    }

}

/*
payment.paypal.Ipn(Ahmad, Yakoob Ahmad, web_accept, info@zombieinvasion.global, San Jose, US, 2.00, 17:36:47 Oct 08, 2014 PDT, 95131, Pending, 1 Main St, Yakoob, info@yakoobahmad.com, DF7EY7UK5AJCY, A9LC3Qajo-H2V8mPq4eIktgPvG2RAhAk1mUGxkjLHOTnP5Afo6HMxBoO, instant, null, US, null, confirmed, 0, 3.8, USD, id10t, CA, null, verified, null, Donation, 0.00, windows-1252, null, null, 2.00, 6D582168A18596117, null, United States)
 */