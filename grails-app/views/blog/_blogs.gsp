
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


<g:javascript plugin="remote-pagination" library="remoteNonStopPageScroll"/>

<g:each in="${contents}" var="it" status="index">


    <div class="jumbotron jumbotron2">

        <div class="well" style="background:url(${assetPath(src: 'widget.jpg')}) right top no-repeat;">

            <div><a style="text-decoration: none" href="#" title="Permalink to ${raw(it.subject)}" rel="bookmark"><span id="blog-subject">${raw(it.subject)}</span></a></div>

            <span>by </span>
            <span><a href="#" title="View all posts by ${it.author.username}">${it.author.username}</a></span>
            <span> @ </span>
            <span><g:formatDate format="MM/dd/yyyy hh:mm:ss a z" date="${it.created}"/></span>

        </div>

        <p id="blog-title">${raw(it.title)}</p>
        <p>${raw(it.body)}</p>


        <div class="well well-sm">

            <div id = "likeResult${it.id}"></div>

            <table width="100%" border="0" class="blogFooter">
                <tr>

                    <td>
                        <g:formRemote id="likeForm${it.id}" name="likeForm${it.id}" update="likeResult${it.id}" url='[uri: "/like/${it.id}"]'>
                            <ul class="nav nav-pills">

                                <li>

                                    <button style="border:0;background-color:transparent;color:#99090A;margin-top: 8px;">
                                        <span class="glyphicon glyphicon-thumbs-up"></span> like
                                        <span class="badge" id="likesCount${it.id}">${it?.likes?.size()}</span>
                                    </button>

                                </li>

                                <li>
                                    <g:if test="${it.commentsEnabled.toBoolean()==false}"><a>Comments Off</a></g:if>
                                    <g:else>
                                        <a class='ajax' href="comment/${it.id}" title="comment on: ${it.subject}">
                                            Comments
                                            <span class="badge" id="commentsCount${it.id}">${it.comments?.size()}</span>
                                        </a>

                                    </g:else>
                                </li>

                            </ul>
                        </g:formRemote>
                    </td>
                    <td class="tags" width="30%">
                        <ul class="nav nav-pills">
                            <g:render template="/blog/blogCategories" model="[categories:it.categories]"/>
                        </ul>
                    </td>
                </tr>
            </table>


        </div>



    </div>

    <script>

        $(document).ready(function() {


            var socket${it.id} = new SockJS("${createLink(uri: '/stomp')}");

            var client${it.id} = Stomp.over(socket${it.id});

            var topic${it.id} = '/topic/blog/${it.id}';


            client${it.id}.connect({}, function () {

                client${it.id}.subscribe(topic${it.id}, function (message) {

                    if (message.body) {

                        var counts = jQuery.parseJSON(message.body);

                        if (counts.comments)
                            $("#commentsCount${it.id}").html(counts.comments);

                        if (counts.likes)
                            $("#likesCount${it.id}").html(counts.likes);
                    }
                });
            });
        });
    </script>


</g:each>

<util:remoteNonStopPageScroll action="list" controller="blog"  total="${total}" update="blog_content" loadingHTML="loadingBlogID"/>