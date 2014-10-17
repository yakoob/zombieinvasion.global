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
        body nullable: false
        subject nullable: false
        categories nullable: true
    }

    static mapping = {
        comments lazy: false
        categories lazy: false
        body type: "text"
    }

    def beforeInsert(){
        this.addToCategories(new BlogCategory(tag: "UnDead Story", blogEntry: this))
    }

    static List orderByLikesCount(max=10, offset=0) {

        String hql = '''
        SELECT t.id
        FROM BlogEntryByLikes t
        '''

        def ids = BlogEntry.executeQuery(hql, [max: max?:10, offset:offset?:0])
        return BlogEntry.getAll(ids)
    }

}

