package blog

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
class BlogCommentController {

    @Secured("permitAll")
    def index() {

        if (!params.blogId){
            notFound()
            return
        }

        render view: "/blog/_blogComments", model: [comments: BlogEntry.get(params.blogId)?.comments]
    }

    @Transactional
    def save(BlogComment blogCommentInstance) {

        if (blogCommentInstance == null) {
            notFound()
            return
        }

        if (blogCommentInstance.hasErrors()) {
            respond blogCommentInstance.errors, view: 'create'
            return
        }

        blogCommentInstance.save flush: true

        respond blogCommentInstance, [status: CREATED]

    }

    @Transactional
    def update(BlogComment blogCommentInstance) {

        if (blogCommentInstance == null) {
            notFound()
            return
        }

        if (blogCommentInstance.hasErrors()) {
            respond blogCommentInstance.errors, view: 'edit'
            return
        }

        blogCommentInstance.save flush: true

        respond blogCommentInstance, [status: OK]

    }

    @Transactional
    def delete(BlogComment blogCommentInstance) {

        if (blogCommentInstance == null) {
            notFound()
            return
        }

        blogCommentInstance.delete flush: true

        render status: NO_CONTENT

    }

    protected void notFound() {
        render status: NOT_FOUND
    }
}
