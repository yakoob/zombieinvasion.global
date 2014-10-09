
<sec:ifLoggedIn>

    <sec:ifAllGranted roles="ROLE_TWITTER">


            <div class="alert alert-danger" role="alert">
                <asset:image src="zombie.svg" width="40"/>
                <g:if test="${hasStory?.toBoolean()==false}">
                    <strong>Hi <sec:username></sec:username> You have yet to tell your UnDead Story...</strong>
                </g:if>
                <g:else>
                    <strong>Hi <sec:username></sec:username> tell another UnDead Story...</strong>
                </g:else>
                <span style="float: right"><a class='ajax' href="${createLink(uri: '/blog/form')}" title="Tell your UnDead story"><button type="button" class="btn btn-lg btn-danger"><span class="glyphicon glyphicon-pencil"></span> Tell Your UnDead Story</button></a></span>
            </div>



    </sec:ifAllGranted>

</sec:ifLoggedIn>

<sec:ifNotLoggedIn>

    <div class="alert alert-danger" role="alert">
        <asset:image src="zombie.svg" width="40"/>
        <strong>mmm... you have good brains ...</strong>
        <span style="float: right"><a href="${createLink(uri: '/account')}" title="Tell your UnDead story"><button type="button" class="btn btn-lg btn-danger"><span class="glyphicon glyphicon-pencil"></span> Login to Tell Your UnDead Story</button></a></span>
    </div>

</sec:ifNotLoggedIn>


<script>

    $(document).ready(function() {


        var socketBlogs = new SockJS("${createLink(uri: '/stomp')}");

        var clientBlogs = Stomp.over(socketBlogs);

        var topicBlogs = '/topic/blogs';

        clientBlogs.connect({}, function () {

            clientBlogs.subscribe(topicBlogs, function (message) {

                if (message.body) {

                    // var blogContent = jQuery.parseJSON(message.body);
                    console.log(message.body);
                    mainLayoutApi.loadBlogs('blogs-content', '${createLink(uri: '/blogs?sort=id&order=desc')}');

                    /*


                    if (counts.comments)
                        $("#commentsCount").html(counts.comments);

                    if (counts.likes)
                        $("#likesCount").html(counts.likes);
                    */
                }
            });
        });
    });
</script>


<g:javascript plugin="remote-pagination" library="remoteNonStopPageScroll"/>

<g:each in="${contents}" var="it" status="index">

    <g:render template="/blog/blog" model="[blog:it]"></g:render>

</g:each>

<util:remoteNonStopPageScroll action="list" controller="blog"  total="${total}" update="blog_content" loadingHTML="loadingBlogID"/>