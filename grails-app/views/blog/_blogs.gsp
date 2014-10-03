<g:if test="${!blogs.size()}">
<article class="is-post is-post-excerpt">
    <header>
        <h1>no records found matching your query</h1>
    </header>
    <div class="info">
        <strong style="color: red">Whops!</strong>
    </div>
</article>

</g:if>






<g:each in="${blogs}">


            <div class="jumbotron">
                <div style="background:url(${assetPath(src: 'widget.jpg')}) right top no-repeat;">
                <a style="text-decoration: none" href="#" title="Permalink to ${raw(it.subject)}" rel="bookmark"><span id="blog-subject">${raw(it.subject)}</span></a>


                <p id="blog-title">${raw(it.title)}</p>


                <span >Posted </span><span class="onDate">on </span>
                <span >${it.created.monthOfYear().asText} ${it.created.dayOfMonth().asText},  ${it.created.year().asText}</span>
                <span > at ${it.created.toTimeOfDay()}</span></a> | <span class="meta-sep">by</span>
                <span ><a href="#" title="View all posts by ${it.author.username}">${it.author.username}</a></span>


                <p>${raw(it.body)}</p>

                <button type="button" class="btn btn-default btn-lg">
                    <span class="glyphicon glyphicon-star"></span> Star
                </button>
                <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
                </div>
            </div><!--/span-->


    <%---


        <p id="blog-title">${raw(it.title)}</p>
        ${raw(it.body)}



        <div class="entry-utility">
        <span class="tag-links">
        <span class="entry-utility-prep entry-utility-prep-tag-links">Tagged - </span>
        <g:render template="/blog/blogCategories" model="[categories:it.categories]"/>
        </span>
        <span class="meta-sep">|</span>
        <span class="comments-link"><span><g:if test="${it.commentsEnabled}==true">Comments Off</g:if><g:else>${it.comments.size()} Comments</g:else></span>
        </div>

 ---%>



</g:each>
