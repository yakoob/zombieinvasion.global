<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>

<sec:ifLoggedIn>

    <sec:ifAllGranted roles="ROLE_TWITTER">

        <g:formRemote id="saveCommentForm" name="saveCommentForm" onComplete="jQuery('.jquery').colorbox.close();" url="[controller: 'blog', action:'saveComment']">

            <g:textArea class="form-control" name="comment" value="" rows="10"/>

            <button type="button" class="btn btn-lg btn-danger" onclick="$('#saveCommentForm').submit();">
                <span class="glyphicon glyphicon-floppy-save"></span> Submit Comment
            </button>


            <g:hiddenField name="blogId" value="${blogEntry.id}"/>

        </g:formRemote>

    </sec:ifAllGranted>

</sec:ifLoggedIn>

<div class="panel panel-danger">
    <!-- Default panel contents -->
    <div class="panel-heading"><strong>Comments for: ${blogEntry.subject}... ${blogEntry.title}</strong></div>

    <!-- Table -->
    <table class="table" border="0" cellpadding="4" cellspacing="0">
        <g:each in="${comments.sort{it.created}}" var="comment">
        <tr>
            <td>
                <div class="well alert alert-danger">
                    <strong>
                    <span>by </span>
                    <span><a href="#" title="View all posts by ${comment.user.username}">${comment.user.username}</a></span>
                    <span> @ </span>
                    <span><g:formatDate format="MM/dd/yyyy hh:mm:ss a z" date="${comment.created}"/></span>
                    </strong>
                </div>


                <p>${raw(comment.comment.replace('\n', '<br>\n'))}</p>
            </td>

        </tr>

        </g:each>

    </table>
</div>

</body>
</html>