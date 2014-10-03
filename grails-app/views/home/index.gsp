<!DOCTYPE html>

<html>

<head>

    <meta name='layout' content='main'/>

</head>

<body>

    <div>
        <div style="float: left; width: 70%">
            <g:render template="/blog/blogs" model="[blogs:blogs, hasStory:hasStory]"/>
        </div>

        <div style="float: right; width: 25%">

            <asset:image src="blog_zombies.png" width="280"/>

            <center>
                <g:paginate class="nopaddingNav" controller="home" maxsteps="4" action="index" total="${cityCount}" />
            </center>

            <ul class="list-group">

                <g:each in="${cities}">
                <li class="list-group-item">
                    <span class="badge"><g:formatNumber number="${it.population}" format="###,##0" /></span>
                    ${it.city}, ${it.countryCode}
                </li>
                </g:each>

                <center>
                    <g:paginate class="nopaddingNav" controller="home" maxsteps="4" action="index" total="${cityCount}" />
                </center>

            </ul>






        </div>
    </div>


</body>

</html>
