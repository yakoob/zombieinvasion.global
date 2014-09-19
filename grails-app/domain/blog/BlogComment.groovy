package blog

import org.joda.time.DateTime
import user.User


class BlogComment {

    User user
    String comment
    DateTime created = DateTime.now()

    static mapping = {
        comment type: "text"
    }

    static constraints = {
        user nullable: false
        comment nullable: false, blank: false
    }
}
