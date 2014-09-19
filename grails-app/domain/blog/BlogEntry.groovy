package blog

import user.User
import org.jadira.usertype.dateandtime.joda.PersistentDateTime
import org.joda.time.DateTime

class BlogEntry {

    User author
    String title
    String subject
    String body
    DateTime created = DateTime.now()
    Boolean commentsEnabled = true

    static hasMany = [categories: BlogCategory, comments: BlogComment]

    static constraints = {
        subject nullable: true
        categories nullable: true
    }

    static mapping = {
        body type: "text"
        created type: PersistentDateTime
    }

}

