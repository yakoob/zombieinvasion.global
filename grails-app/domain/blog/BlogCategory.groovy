package blog

class BlogCategory {

    String tag

    static belongsTo = [blogEntry: BlogEntry]

    static constraints = {
    }
}
