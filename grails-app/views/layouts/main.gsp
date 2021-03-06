
<!DOCTYPE html>

<head>

    <meta http-equiv="content-type" content="text/html; charset=utf-8" />

    <title><g:layoutTitle default="Zombie Invasion | Chipping in one Bite at a time" /></title>

    <meta name="description" content="Zombie Invasion Global, Chipping in on Bite at a time. The social network for zombies, zombie walks and all things Zombie..."/>
    <meta name="keywords" content="zombie invasion,zombie walk,zombie flashmob,flash mob,zombies,living dead,undead,walking dead,dead,dawn of the dead,social network" />
    <meta name="author" content="Yakoob Ahmad">

    <link rel="canonical" href="https://zombieinvasion.global/"/>
    <link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
    <link rel="icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">

    <asset:stylesheet src="style.css"/>
    <asset:stylesheet src="colorbox.css"/>
    <asset:stylesheet src="bootstrap.min.css"/>
    <asset:stylesheet src="bootstrap-theme.min.css"/>

    <asset:javascript src="jquery.min.js"/>
    <asset:javascript src="Modernizr.js"/>
    <asset:javascript src="sockjs.js"/>
    <asset:javascript src="stomp.js"/>
    <asset:javascript src="spring-websocket.js"/>
    <asset:javascript src="jquery.colorbox-min.js"/>
    <asset:javascript src="bootstrap.min.js"/>
    <asset:javascript src="MainLayoutAPI.js"/>

    <g:layoutHead/>

    <script>
        var mainLayoutApi = new MainLayoutAPI();
        mainLayoutApi.init();

        function connectCallback(){
            // console.log("connect call back");
            // client.send("/app/hello", {priority: 9}, JSON.stringify({ 'name': 'Joe' }));
        }

        $(document).ready(function() {
            websocket = new SockJS("${createLink(uri: '/stomp')}");
            client = Stomp.over(websocket);

            var headers = {
                login: 'mylogin',
                passcode: 'mypasscode',
                'client-id': 'server01'
            };

            client.connect(headers, connectCallback);

        });




    </script>
</head>

<body>

<div id="topper">

    <div id="splatter">

        <div id="wrapper">

            <div id="header">

                <h1 id="site-title">
                    <span>
                        <a href="${createLink(uri: '/home?ni=home')}" title="ZombieInvasion.global" rel="${createLink(uri: '/home?ni=home')}">Zombie Invasion</a>
                    </span>
                </h1>

                <div id="site-description">Chipping in one Bite at a time...</div>

                <div style="float: right; padding: 0 0 0 0; margin: 0 0 0 0;">
                    <a href="https://twitter.com/UnDead_zZz" class="twitter-follow-button" data-show-count="false" data-size="large">Follow @UnDead_zZz</a>
                    <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>
                </div>

                <g:render template="/layouts/navigation"/>

            </div><!-- #header -->


            <div class="container">

                <div class="row row-offcanvas row-offcanvas-right">

                    <div id="body-content"><g:layoutBody/></div>

                </div><!--/row-->



                <div id="footer" role="contentinfo">
                    <div id="colophon"></div>
                    <div id="site-info">
                        <a href="http://www.yakoobahmad.com/" target="_blank" title="Zombie Invasion"> ZombieInvasion.global is powered by Yakoob Ahmad </a>
                    </div><!-- #site-info -->
                </div><!-- #footer -->


            </div><!--/.container-->

</div></div></div>
<script>
    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
        (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
            m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
    })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

    ga('create', 'UA-55350019-1', 'auto');
    ga('send', 'pageview');
</script>
<br><br><br><br><br><br><br><br><br>
</body>
</html>
