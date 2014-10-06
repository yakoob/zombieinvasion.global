package region

import org.joda.time.DateTime
import user.TwitterUser

class UndeadSighting {

    String latitude
    String longitude
    TwitterUser user
    City city
    Date created = DateTime.now().toDate()

}
