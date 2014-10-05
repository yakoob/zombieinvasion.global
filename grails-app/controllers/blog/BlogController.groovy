package blog

import grails.plugin.springsecurity.annotation.Secured
import org.springframework.http.HttpStatus
import user.User

@Secured("permitAll")
class BlogController {

    def springSecurityService
    def blogService
    def brokerMessagingTemplate

    def index() {
        render view: "index", model: [blogs:blogService.findBlogs(), hasStory:BlogEntry.findByAuthor(springSecurityService.currentUser)?true:false]
    }

    def list(){
        println BlogEntry.list(params)
        render view:"index", model:[total:BlogEntry.count, contents: BlogEntry.list(params)]
    }

    def show() {

        Long id = params.id as Long
        if (id)
            render view: "show", model: [blog:BlogEntry.get(id)]
        else
            render status: HttpStatus.NOT_FOUND
    }

    def comment() {


        Long blogId = params.blogId as Long
        if (blogId) {
            def blog = BlogEntry.get(blogId)

            render view: "blogComment", model: [blogEntry:BlogEntry.get(blogId), comments:blog.comments]
        }

        else {
            render status: HttpStatus.NO_CONTENT
        }




    }

    def saveComment(){

        def user = springSecurityService.currentUser

        if (user) {

            try {

                def blog = BlogEntry.get(params.blogId)

                if (!blog) {
                    render status: HttpStatus.FAILED_DEPENDENCY
                    return
                }

                def comment = new BlogComment(params)
                comment.user = user
                comment.blogEntry = blog
                comment.save()

                blog.addToComments(comment)
                blog.save(flush: true)

                updateStats(blog.id)

                render status: HttpStatus.OK
                return

            } catch (e) {

                log.error(e)
                render status: HttpStatus.INTERNAL_SERVER_ERROR
                return

            }


        } else {
            render status: HttpStatus.UNAUTHORIZED
        }
    }

    def like(){

        User authenticatedUser = springSecurityService.currentUser

        if (!authenticatedUser){
            render status: HttpStatus.OK, template: "/login/alertLoginRequired"
            return
        }

        def blog = BlogEntry.get(params.id)

        if (!blog) {
            render status: HttpStatus.NOT_FOUND
            return
        }

        try {

            if (blog.likes.find{it.id == authenticatedUser.id}){

                render status: HttpStatus.OK, template: "alertAlreadyLiked"
                return
            }

            /*
            if (!blog.likes.find{it.id == authenticatedUser.id }) {

            }
            */
            authenticatedUser.addToLikes(blog)
            authenticatedUser.save(flush: true)

            updateStats(blog.id)

            render status: HttpStatus.OK
            return

        } catch (e){
            log.error(e)
            render status: HttpStatus.INTERNAL_SERVER_ERROR
            return
        }


    }

    def search(){

        def includedCategories = null
        def searchPhrase = null

        if (params.categories){
            // ie: params.categories=Java,Foo
            includedCategories = params.categories.split(",").toList().unique()
        }

        if (params.searchPhrase){
            searchPhrase = params.searchPhrase
        }

        def blogs = blogService.search(includedCategories, searchPhrase)

        render view: "index", model: [blogs:blogs]
    }

    def updateStats(id){

        def blog = BlogEntry.get(id)

        def counts = [comments:blog.comments.size(), likes: blog.likes.size()]

        String topic = "/topic/blog/$id"

        brokerMessagingTemplate.convertAndSend(topic, counts)

    }
}
