package blog

import user.User
import org.joda.time.DateTime

class BlogEntry {

    User author
    String title
    String subject
    String body
    Date created = DateTime.now().toDate()
    Boolean commentsEnabled = true

    static hasMany = [categories: BlogCategory, comments: BlogComment, likes: User]

    static belongsTo = [User]

    static constraints = {
        categories nullable: true
    }

    static mapping = {
        comments lazy: false
        categories lazy: false
        body type: "text"
        sort id: "desc" // or "asc"
    }

    def beforeInsert(){
        this.addToCategories(new BlogCategory(tag: "UnDead Story", blogEntry: this))
    }

}

