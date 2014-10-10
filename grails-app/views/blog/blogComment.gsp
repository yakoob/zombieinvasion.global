

<div>
    <a style="text-decoration: none" href="#" rel="bookmark">
        <span id="blog-subject">
            ( ${comments.size()} ) comments for: ${blogEntry.subject}... ${blogEntry.title}
        </span>
    </a>
</div>

<div style="height: 64%; overflow: auto">
<g:each in="${comments.sort{ -it.id}}" var="comment">

    <div class="jumbotron2">

        <div class="well" style="background:url(${assetPath(src: 'widget.jpg')}) right top no-repeat;">

            <h4><asset:image src="${comment.user.twitterUser.icon.path}" width="30"></asset:image> by ${comment.user.username} @ <g:formatDate format="MM/dd/yyyy hh:mm:ss a z" date="${comment.created}"/></h4>
            <p><strong>${raw(comment.comment.replace('\n', '<br>\n'))}</strong></p>

        </div>

    </div>


</g:each>
</div>
<div style="height: 30%; overflow: auto" >
<sec:ifLoggedIn>

    <sec:ifAllGranted roles="ROLE_TWITTER">

        <g:formRemote id="saveCommentForm" name="saveCommentForm" onComplete="jQuery('.jquery').colorbox.close();" url="[controller: 'blog', action:'saveComment']">

            <g:textArea class="form-control" name="comment" value="" rows="5"/>

            <button type="button" class="btn btn-lg btn-danger" onclick="$('#saveCommentForm').submit();" style="margin: 5px">
                <span class="glyphicon glyphicon-floppy-save"></span> Submit Comment
            </button>


            <g:hiddenField name="blogId" value="${blogEntry.id}"/>

        </g:formRemote>

    </sec:ifAllGranted>

</sec:ifLoggedIn>

<sec:ifNotLoggedIn>
    <div >
        <h3>Post a Comment:</h3>
        <g:render template="/login/alertLoginRequired"></g:render>
    </div>

</sec:ifNotLoggedIn>

</div>


