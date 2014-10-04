package blog

import grails.plugin.springsecurity.annotation.Secured
import org.springframework.http.HttpStatus

@Secured("permitAll")
class BlogController {

    def springSecurityService
    def blogService

    def index() {
        render view: "index", model: [blogs:blogService.findBlogs(), hasStory:BlogEntry.findByAuthor(springSecurityService.currentUser)?true:false]
    }

    def show() {

        Long id = params.id as Long
        if (id)
            render view: "show", model: [blog:BlogEntry.get(id)]
        else
            render "foo"
    }

    def comment() {


        Long blogId = params.blogId as Long
        if (blogId) {
            def blog = BlogEntry.get(blogId)

            render view: "blogComment", model: [blogEntry:BlogEntry.get(blogId), comments:blog.comments]
        }

        else {
            render HttpStatus.NO_CONTENT.name()
        }




    }

    def saveComment(){
        def user = springSecurityService.currentUser
        if (user) {
            Long blogId = params.blogId as Long
            if (blogId)
                render view: "blogComment", model: [blogEntry:BlogEntry.get(blogId)]
            else
                render HttpStatus.NO_CONTENT.name()
        } else {
            render HttpStatus.UNAUTHORIZED.name()
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
}
