<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>



<sec:ifLoggedIn>

    <sec:ifAllGranted roles="ROLE_TWITTER">

        <g:textArea class="form-control" name="myField" value="" rows="10"/>

        <div style="margin: 5px;">
            <a class='ajax' href="shout">
                <button type="button" class="btn btn-lg btn-danger">
                    <span class="glyphicon glyphicon-floppy-save"></span> Submit Comment
                </button>
            </a>
        </div>

    </sec:ifAllGranted>

</sec:ifLoggedIn>




<div class="panel panel-danger">
    <!-- Default panel contents -->
    <div class="panel-heading"><strong>Comments for: ${blogEntry.subject}... ${blogEntry.title}</strong></div>

    <!-- Table -->
    <table class="table" border="0">


        <g:each in="${comments}" var="comment">



        <tr>
            <td>
                <div class="well">



                    <span>by </span>
                    <span><a href="#" title="View all posts by ${comment.user.username}">${comment.user.username}</a></span>
                    <span> @ </span>
                    <span><g:formatDate format="MM/dd/yyyy hh:mm:ss a z" date="${comment.created}"/></span>

                </div>
                <p>${raw(comment.comment)}</p>
            </td>


        </tr>

        </g:each>

    </table>
</div>


</body>
</html>