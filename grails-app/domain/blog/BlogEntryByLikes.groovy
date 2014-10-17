package blog

class BlogEntryByLikes {

    Date created
    Long likes

    static constraints = {

    }

    def save(){
        throw new RuntimeException("no can do")
    }

    def beforeDelete(){
        throw new RuntimeException("no can do")
    }

    def beforeInsert(){
        throw new RuntimeException("no can do")
    }

    def beforeUpdate(){
        throw new RuntimeException("no can do")
    }

    def createSql(){
        def sql = """
        CREATE VIEW `blog_entry_by_likes` AS
        SELECT
           `blog_entry`.`id` AS `id`,
           `blog_entry`.`created` AS `created`,
           (select count(0) FROM `user_likes` where (`user_likes`.`blog_entry_id` = `blog_entry`.`id`)) AS `likes`
        FROM
            `blog_entry`
        ORDER BY
            `likes` DESC,
            `blog_entry`.`created` DESC;
        """
    }

}
