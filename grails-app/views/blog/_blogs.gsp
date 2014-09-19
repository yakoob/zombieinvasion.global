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


    <div id="post-${it.id}">
        <a style="text-decoration: none" href="#" title="Permalink to ${raw(it.subject)}" rel="bookmark"><span id="blog-subject">${raw(it.subject)}</span></a>
        <div class="entry-meta">
            <span class="meta-prep meta-prep-author">Posted </span><span class="onDate">on </span>
            <a href="#" title="4:33 am" rel="bookmark">
                <span class="entry-date">${it.created.monthOfYear().asText} ${it.created.dayOfMonth().asText},  ${it.created.year().asText}</span>
                <span class="entry-time"> at ${it.created.toTimeOfDay()}</span></a> | <span class="meta-sep">by</span>
                <span class="author vcard"><a class="url fn n" href="#" title="View all posts by ${it.author.username}">${it.author.username}</a></span>

        </div>

        <div class="entry-content">
            <p id="blog-title">${raw(it.title)}</p>
            ${raw(it.body)}

        </div>

        <div class="entry-utility">
            <span class="tag-links">
                <span class="entry-utility-prep entry-utility-prep-tag-links">Tagged - </span>
                <g:render template="/blog/blogCategories" model="[categories:it.categories]"/>
            </span>
            <span class="meta-sep">|</span>
            <span class="comments-link"><span><g:if test="${it.commentsEnabled}==true">Comments Off</g:if><g:else>${it.comments.size()} Comments</g:else></span>
        </div>

    </div> <!-- #post -->

    <!-- only show when not last -->
    <br><hr><br>


</g:each>
