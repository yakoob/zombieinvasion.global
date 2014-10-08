<sec:ifLoggedIn>

    <sec:ifAllGranted roles="ROLE_TWITTER">

        <g:formRemote id="saveBlogForm" name="saveBlogForm" onComplete="jQuery('.jquery').colorbox.close();" url="[controller: 'blog', action:'saveBlog']">


            <div class="input-group input-group-lg">
                <span class="input-group-addon"><span class="glyphicon glyphicon-question-sign"></span></span>
                <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject">
            </div>

            <br>

            <div class="input-group input-group-lg">
                <span class="input-group-addon"><span class="glyphicon glyphicon-info-sign"></span></span>
                <input type="text" class="form-control" name="title" id="title" placeholder="Title">
            </div>

            <br>

            <div class="input-group input-group-lg">
                <span class="input-group-addon"><span class="glyphicon glyphicon-envelope"></span></span>
                <g:textArea name="body" id="body" value="" rows="20" cols="135" placeholder="" />

            </div>

            <button type="button" class="btn btn-lg btn-danger" onclick="$('#saveBlogForm').submit();" style="margin: 5px">
                <span class="glyphicon glyphicon-floppy-save"></span> <g:if test="${blog}">Save</g:if><g:else>Submit</g:else> UnDead Story
            </button>

            <g:if test="${blog}">
                <g:hiddenField name="id" value="${blog.id}"/>
            </g:if>

        </g:formRemote>

    </sec:ifAllGranted>

</sec:ifLoggedIn>

<sec:ifNotLoggedIn>
    <div >
        <h3>Post a Comment:</h3>
        <g:render template="/login/alertLoginRequired"></g:render>
    </div>

</sec:ifNotLoggedIn>
