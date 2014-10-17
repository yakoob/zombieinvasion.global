
<sec:ifLoggedIn>

    <sec:ifAllGranted roles="ROLE_TWITTER">


            <div class="alert alert-danger" role="alert">
                <asset:image src="zombie.svg" width="40" height="50"/>
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
        <asset:image src="zombie.svg" width="40" height="50"/>
        <strong>mmm... you have good brains ...</strong>
        <span style="float: right"><a href="${createLink(uri: '/account')}" title="Tell your UnDead story"><button type="button" class="btn btn-lg btn-danger"><span class="glyphicon glyphicon-pencil"></span> Login to Tell Your UnDead Story</button></a></span>
    </div>

</sec:ifNotLoggedIn>

<script>

    $(document).ready(function() {

        setTimeout(function(){

            client.subscribe('/topic/blogs', function (message) {

                if (message.body) {

                    try {
                        var tempScrollTop = $(window).scrollTop();
                        var oldContentHeight=$('#blog_content').innerHeight();

                        $('#blog_content').prepend($.parseJSON(message.body));
                        var mainLayoutApi = new MainLayoutAPI();
                        mainLayoutApi.colorBox();

                        var heightDiff=$('#blog_content').innerHeight()-oldContentHeight;
                        $(window).scrollTop(tempScrollTop+heightDiff);
                    } catch(e){
                        // something when wrong
                    }

                }

            });

        }, 2000);

    });

</script>

<g:javascript plugin="remote-pagination" library="remoteNonStopPageScroll"/>

<g:each in="${contents}" var="it" status="index">

    <g:render template="/blog/blog" model="[blog:it]"></g:render>

</g:each>

<util:remoteNonStopPageScroll action="list" controller="blog"  total="${total}" update="blog_content" loadingHTML="loadingBlogID"/>