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
        params.order = "desc"
        params.sort = "id"
        render view:"index", model:[total:BlogEntry.count, contents: BlogEntry.list(params)]
    }

    def list(){
        params.order = "desc"
        params.sort = "id"
        render view:"index", model:[total:BlogEntry.count, contents: BlogEntry.list(params)]
    }

    def latest(){
        def latest
        if (springSecurityService.loggedIn)
            latest = BlogEntry.findAllByAuthor(springSecurityService.currentUser).id.first()
        else
            latest = BlogEntry.last()

        redirect(uri: "/blogs/${latest}")
    }

    def show() {

        Long id = params.id as Long
        if (id)
            render view: "show", model: [blog:BlogEntry.get(id)]
        else
            render status: HttpStatus.NOT_FOUND
    }

    def blogForm(){

        def user = springSecurityService.currentUser

        if (user) {

            def userBlogCount = BlogEntry.findAllByAuthor(user).id.size()

            if (userBlogCount>1){
                redirect(uri: "/payment")
                return
            }


            if (params.id) {

                render view: "displaySave", model: [blog:BlogEntry.get(params.id)]

            } else {

                render view: "displaySave"

            }
        } else {
            render status: HttpStatus.UNAUTHORIZED, text: HttpStatus.UNAUTHORIZED.name()
        }


    }

    def saveBlog(){

        def user = springSecurityService.currentUser

        if (user) {

            try {

                def blog

                if (params.id){

                    blog = BlogEntry.get(params.id)

                    if (!blog) {
                        render status: HttpStatus.FAILED_DEPENDENCY
                        return
                    }

                } else {
                    blog = new BlogEntry(params)
                }


                blog.author = user

                blog.save()

                render status: HttpStatus.OK

                notifyJmsBlogsTopic(blog.id)

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
                notifyJmsTopic(blog.id)

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

            authenticatedUser.addToLikes(blog)
            authenticatedUser.save(flush: true)

            notifyJmsTopic(blog.id)

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


    def notifyJmsBlogsTopic(id){

        def blog = BlogEntry.get(id)

        String topic = "/topic/blogs"

        def html = render template: "/blog/blog", model:[blog:blog]


        brokerMessagingTemplate.convertAndSend(topic, html.toString())

    }


    def notifyJmsTopic(id){

        def blog = BlogEntry.get(id)

        def counts = [comments:blog.comments.size(), likes: blog.likes.size()]

        String topic = "/topic/blog/$id"

        brokerMessagingTemplate.convertAndSend(topic, counts)

    }
}
