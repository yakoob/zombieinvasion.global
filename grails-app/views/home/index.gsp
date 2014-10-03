<!DOCTYPE html>

<html>

<head>

    <meta name='layout' content='main'/>

</head>

<body>


<%---


    <g:render template="/blog/blogs" model="[blogs:blogs]"/>


    <ul class="pagination">
        <g:paginate  controller="home" maxsteps="3" omitNext="true" omitPrev="true" action="index" total="${cityCount}" />
    </ul>

    <div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar" role="navigation">

        <div class="list-group">

            <g:each in="${cities}">
                <a href="#" class="list-group-item">(2 / <g:formatNumber number="${it.population}" format="###,##0" />) ${it.city}, ${it.countryCode}</a>
            </g:each>

        </div>
    </div><!--/span-->




---%>
    <div>
        <div style="float: left; width: 70%">
            <g:render template="/blog/blogs" model="[blogs:blogs]"/>
        </div>

        <div style="float: right; width: 25%">


            <center>
            <sec:ifLoggedIn>

                <script>
                    $(document).ready(function(){
                        $(".ajax").colorbox({rel:'group3', transition:"none", width:"50%", height:"50%"});

                        $(".ajaxs").colorbox({
                            onOpen:function(){ console.log('onOpen: colorbox is about to open'); },
                            onLoad:function(){ console.log('onLoad: colorbox has started to load the targeted content'); },
                            onComplete:function(){ console.log('onComplete: colorbox has displayed the loaded content'); },
                            onCleanup:function(){ console.log('onCleanup: colorbox has begun the close process'); },
                            onClosed:function(){ console.log('onClosed: colorbox has completely closed'); }
                        });


                    });
                </script>

                <sec:ifAllGranted roles="ROLE_TWITTER">
                    <p><a class='ajax' href="shout" title="Tell your UnDead story"><button type="button" class="btn btn-lg btn-danger"><span class="glyphicon glyphicon-pencil"></span> Tell Your UnDead Story</button></a></p>
                </sec:ifAllGranted>

            </sec:ifLoggedIn>
            </center>

            <asset:image src="blog_zombies.png" width="280"/>

            <div class="list-group">

                <g:each in="${cities}">
                    <a href="#" class="list-group-item">(2 / <g:formatNumber number="${it.population}" format="###,##0" />) ${it.city}, ${it.countryCode}</a>
                </g:each>

            </div>
        </div>
    </div>










</body>

</html>
