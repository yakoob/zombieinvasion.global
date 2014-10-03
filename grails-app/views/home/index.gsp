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

            <ul class="list-group">
                <g:each in="${cities}">
                <li class="list-group-item">
                    <span class="badge"><g:formatNumber number="${it.population}" format="###,##0" /></span>
                    ${it.city}, ${it.countryCode}
                </li>
                </g:each>
            </ul>



            <g:paginate controller="home" maxsteps="7" omitNext="true" omitPrev="true" action="index" total="${cityCount}" />


        </div>
    </div>


</body>

</html>
