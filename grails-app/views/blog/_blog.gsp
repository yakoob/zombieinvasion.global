

<div class="jumbotron jumbotron2">

    <div class="well" style="background:url(${assetPath(src: 'widget.jpg')}) right top no-repeat;">

            <div><a style="text-decoration: none" href="${createLink(uri: "/blogs/$blog.id")}" title="Permalink to ${raw(blog.subject)}"><asset:image src="${blog.author.twitterUser.icon.path}" width="30"></asset:image>  <span id="blog-subject">${raw(blog.subject)}</span></a></div>
            <span><a class="ajax" href="${createLink(uri: "/zombie/${blog.author.id}")}" title="View all posts by ${blog.author.username}">${blog.author.username} <span class="badge" id="account_score">${blog.author.twitterUser.score}</span></a></span>
            <span> @ </span>
            <span><g:formatDate format="MM/dd/yyyy hh:mm:ss a z" date="${blog.created}"/></span>

    </div>

    <p id="blog-title">${raw(blog.title)}</p>

    <p>${raw(blog.body.replace('\n', '<br>\n'))}</p>

    <div class="well well-sm">

        <div id = "likeResult${blog.id}"></div>

        <table width="100%" border="0" class="blogFooter">
            <tr>

                <td>
                    <g:formRemote id="likeForm${blog.id}" name="likeForm${blog.id}" update="likeResult${blog.id}" url='[uri: "/like/${blog.id}"]'>
                        <ul class="nav nav-pills">

                            <li>

                                <button style="border:0;background-color:transparent;color:#99090A;margin-top: 8px;">
                                    <span class="glyphicon glyphicon-thumbs-up"></span> like
                                    <span class="badge" id="likesCount${blog.id}">${blog?.likes?.size()}</span>
                                </button>

                            </li>

                            <li>
                                <g:if test="${blog.commentsEnabled.toBoolean()==false}"><a>Comments Off</a></g:if>
                                <g:else>
                                    <a class='ajax' href="${createLink(uri: "/comment/${blog.id}")}" title="comment on: ${blog.subject}">
                                        Comments
                                        <span class="badge" id="commentsCount${blog.id}">${blog.comments?.size()}</span>
                                    </a>

                                </g:else>
                            </li>

                        </ul>
                    </g:formRemote>
                </td>
                <td class="tags" width="30%">
                    <ul class="nav nav-pills">
                        <g:render template="/blog/blogCategories" model="[categories:blog.categories]"/>
                    </ul>
                </td>
            </tr>
        </table>


    </div>



</div>

<script>

    $(document).ready(function() {


        var socket${blog.id} = new SockJS("${createLink(uri: '/stomp')}");

        var client${blog.id} = Stomp.over(socket${blog.id});

        var topic${blog.id} = '/topic/blog/${blog.id}';


        client${blog.id}.connect({}, function () {

            client${blog.id}.subscribe(topic${blog.id}, function (message) {

                if (message.body) {

                    var counts = jQuery.parseJSON(message.body);

                    if (counts.comments)
                        $("#commentsCount${blog.id}").html(counts.comments);

                    if (counts.likes)
                        $("#likesCount${blog.id}").html(counts.likes);
                }
            });
        });
    });
</script>
