<sec:ifLoggedIn>

    <sec:ifAllGranted roles="ROLE_TWITTER">

        <g:formRemote id="saveBlogForm" name="saveBlogForm" before="validateBlogEntry()" onSuccess="window.location.href='${createLink(uri: "/blogs/latest")}'; jQuery('.jquery').colorbox.close();" url="[controller: 'blog', action:'saveBlog']">


            <div class="input-group input-group-lg">
                <span class="input-group-addon"><span class="glyphicon glyphicon-question-sign"></span></span>
                <g:if test="${blog?.subject}">
                    <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject" value="${blog?.subject}">
                </g:if>
                <g:else>
                    <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject">
                </g:else>

            </div>

            <br>

            <div class="input-group input-group-lg">
                <span class="input-group-addon"><span class="glyphicon glyphicon-info-sign"></span></span>


                <g:if test="${blog?.title}">
                    <input type="text" class="form-control" name="title" id="title" placeholder="Title" value="${blog?.title}">
                </g:if>
                <g:else>
                    <input type="text" class="form-control" name="title" id="title" placeholder="Title">
                </g:else>
            </div>

            <br>

            <div class="input-group input-group-lg">
                <span class="input-group-addon"><span class="glyphicon glyphicon-envelope"></span></span>

                <g:if test="${blog?.body}">
                    <g:textArea name="body" id="body" value="" rows="15" placeholder="" style="width: 100%">${blog?.body}</g:textArea>
                </g:if>
                <g:else>
                    <g:textArea name="body" id="body" value="" rows="15" placeholder="" style="width: 100%" />
                </g:else>
            </div>

            <button type="button" class="btn btn-lg btn-danger" onclick="$('#saveBlogForm').submit();" style="margin: 5px">
                <span class="glyphicon glyphicon-floppy-save"></span> <g:if test="${blog}">Save</g:if><g:else>Submit</g:else> UnDead Story
            </button>

            <g:if test="${blog?.id}">
                <g:hiddenField name="id" value="${blog?.id}"/>
            </g:if>

        </g:formRemote>


        <script>


            function validateBlogEntry(){

                var isValid = true;
                $('input[type="text"]').each(function() {
                    if ($.trim($(this).val()) == '') {
                        isValid = false;
                        $(this).css({
                            "border": "1px solid red",
                            "background": "#FFCECE"
                        });
                    }
                    else {
                        $(this).css({
                            "border": "",
                            "background": ""
                        });
                    }
                });

                if ($("#body").val() == '') {
                    isValid = false;
                    $("#body").css({
                        "border": "1px solid red",
                        "background": "#FFCECE"
                    });
                } else {
                    $("#body").css({
                        "border": "",
                        "background": ""
                    });
                }

                if (isValid == false) {
                    e.preventDefault();
                }

            }
        </script>


    </sec:ifAllGranted>

</sec:ifLoggedIn>

<sec:ifNotLoggedIn>
    <div >
        <h3>Post a Comment:</h3>
        <g:render template="/login/alertLoginRequired"></g:render>
    </div>

</sec:ifNotLoggedIn>
