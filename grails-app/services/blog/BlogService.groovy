package blog

import grails.transaction.Transactional

@Transactional
class BlogService {

    def findBlogs() {
        def blogs = BlogEntry.withCriteria {
            order('created', 'desc')
        }
        return blogs
    }

    def search(List categoryList, searchPhrase=null){

        def c = BlogEntry.createCriteria()
        def blogs = c.list {

            or {

                if (searchPhrase) {
                    ilike("subject", "%$searchPhrase%")
                    ilike("title", "%$searchPhrase%")
                    ilike("body", "%$searchPhrase%")
                }

                if (categoryList?.size()) {

                    categoryList.each { item ->
                        categories {
                            eq("tag", item)
                        }
                    }
                }
            }

            order('created', 'desc')
        }

        return blogs
    }
}
