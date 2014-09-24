package account

import org.joda.time.DateTime
import org.joda.time.DateTimeZone

class Account {

    Status status = Status.DEMO
    SubStatus subStatus = SubStatus.ACTIVE
    String timeZone

    DateTime getLocalTime(){

        if(this.timeZone) {
            DateTime dt = new DateTime()
            DateTime localDt = dt.withZone(DateTimeZone.forID(this.timeZone));
            return localDt
        } else {
            return null
        }

    }

    enum Status {
        DEMO, TRIAL, PAID, CANCELLED
    }

    enum SubStatus {
        ACTIVE, SUSPENDED
    }

    static constraints = {
        timeZone nullable: true
    }

    static mapping = {
        status enumType: 'string'
        subStatus enumType: 'string'
        dynamicUpdate true
        version false
    }

    def beforeDelete() {
        throw RuntimeException("You must get written permission!!!")
    }

}
