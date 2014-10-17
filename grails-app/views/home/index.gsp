<!DOCTYPE html>

<html>

<head>

    <meta name='layout' content='main'/>

</head>

<body>

    <div>
        <div style="float: left; width: 70%">
            <div class="list" id="blog_content" class="container_blogs">
                <g:render template="/blog/blogs" model="[contents:blogs, total:blogsCount, hasStory:hasStory]"/>
            </div>
            <div id="loadingBlogID" style="display: none;"><img src="${resource(dir:'images', file:'loading.png')}" alt=""/></div>
        </div>

        <div style="float: right; width: 25%">

            <asset:image src="blog_zombies.png" width="280"/>


            <ul class="list-group">

                <div class="list" id="city_content">
                    <g:render template="/city/filter" model="[total:cityCount, contents:cities]"/>
                </div>

                <div id="loadingDivId" style="display: none;"><img src="${resource(dir:'images', file:'loading.png')}" alt=""/></div>

            </ul>


        </div>
    </div>


</body>

</html>
