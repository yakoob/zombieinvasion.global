package blog

import user.User
import org.joda.time.DateTime

class BlogComment {

    User user
    String comment
    Date created = DateTime.now().toDate()

    static belongsTo = [blogEntry: BlogEntry]

    static mapping = {
        dynamicUpdate true
        version false
        comment type: "text"
    }

    static constraints = {
        user nullable: false
        comment nullable: false, blank: false
    }
}
