
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



    <sec:ifLoggedIn>

        <sec:ifAllGranted roles="ROLE_TWITTER">

            <g:if test="${hasStory?.toBoolean()==false}">
                <div class="alert alert-danger" role="alert">
                    <asset:image src="zombie.svg" width="40"/>
                    <strong>... You have yet to tell your UnDead Story ... >>>  </strong>
                    <span style="float: right"><a class='ajax' href="shout" title="Tell your UnDead story"><button type="button" class="btn btn-lg btn-danger"><span class="glyphicon glyphicon-pencil"></span> Tell Your UnDead Story</button></a></span>
                </div>
            </g:if>


        </sec:ifAllGranted>

    </sec:ifLoggedIn>




<g:each in="${blogs}">


    <div class="jumbotron jumbotron2">

        <div>

            <div class="well" style="background:url(${assetPath(src: 'widget.jpg')}) right top no-repeat;">

                <a style="text-decoration: none" href="#" title="Permalink to ${raw(it.subject)}" rel="bookmark"><span id="blog-subject">${raw(it.subject)}</span></a>

                <p id="blog-title">${raw(it.title)}</p>

                <span>by </span>
                <span><a href="#" title="View all posts by ${it.author.username}">${it.author.username}</a></span>
                <span> @ </span>
                <span><g:formatDate format="MM/dd/yyyy hh:mm:ss a z" date="${it.created.toDate()}"/></span>

            </div>

            <p>${raw(it.body)}</p>

        </div>

        <div class="well well-sm">

            <table width="100%" border="0" class="blogFooter">
                <tr>
                    <td>

                        <ul class="nav nav-pills">

                            <li>
                                <a href="#">
                                    <span class="glyphicon glyphicon-thumbs-up"></span> like
                                    <span class="badge">0</span>
                                </a>
                            </li>

                            <li>
                                <g:if test="${it.commentsEnabled.toBoolean()==false}"><a>Comments Off</a></g:if>
                                <g:else>
                                    <a class='ajax' href="shout" title="comment on: ${it.subject}">
                                        Comments
                                        <span class="badge">${it.comments.size()}</span>
                                    </a>

                                </g:else>
                            </li>

                        </ul>
                    </td>
                    <td class="tags" width="40%">
                        <ul class="nav nav-pills">
                            <g:render template="/blog/blogCategories" model="[categories:it.categories]"/>
                        </ul>
                    </td>
                </tr>
            </table>


        </div>



    </div>
</g:each>
