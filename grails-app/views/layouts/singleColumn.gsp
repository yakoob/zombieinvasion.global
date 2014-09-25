
<!DOCTYPE html>

<head>

    <meta http-equiv="content-type" content="text/html; charset=utf-8" />

    <title><g:layoutTitle default="Zombie Invasion | Chipping in one Bite at a time" /></title>

    <meta name="description" content="Zombie Invasion Global, Chipping in on Bite at a time. The social network for zombies, zombie walks and all things Zombie..."/>
    <meta name="keywords" content="zombie invasion,zombie walk,zombie flashmob,flash mob,zombies,living dead,undead,walking dead,dead,dawn of the dead,social network" />

    <link rel="canonical" href="http://zombieinvasion.global/"/>
    <link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
    <link rel="icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">

    <asset:javascript src="jquery.min.js"/>
    <asset:javascript src="Modernizr.js"/>
    <asset:javascript src="sockjs.js"/>
    <asset:javascript src="stomp.js"/>
    <asset:javascript src="spring-websocket.js"/>
    <asset:javascript src="jquery.magnific-popup.min.js"/>
    <asset:stylesheet src="style.css"/>
    <asset:stylesheet src="magnific-popup.css"/>
    <asset:javascript src="MainLayoutAPI.js"/>

    <style type="text/css" id="custom-background-css">body.custom-background { background-image: url('${assetPath(src:'back.jpg')}'); background-repeat: repeat; background-position: top left; background-attachment: scroll; }</style>

    <g:layoutHead/>


</head>

<body class="home blog custom-background">




<div id="topper">
    <div id="splatter">
        <div id="wrapper" class="hfeed">
            <div id="header">

                <div id="masthead">

                    <div id="branding" role="banner">
                        <h1 id="site-title">
                            <span>
                                <a href="#" title="Theme Preview" rel="home">Zombie Invasion</a>
                            </span>
                        </h1>
                        <div id="site-description">Chipping in one Bite at a time...</div>
                    </div><!-- #branding -->

                    <div id="access" role="navigation">
                        <div class="skip-link screen-reader-text"><a href="#" title="Skip to content">Skip to content</a></div>

                        <g:render template="/layouts/navigation"/>


                        <span style="float:right;">
                            <a href="https://twitter.com/Zombi3Invasion" class="twitter-follow-button" data-show-count="false" data-dnt="true">Follow @Zombi3Invasion</a>
                            <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>
                        </span>
                    </div><!-- #access -->

                </div><!-- #masthead -->

                <div style="clear:both;"> </div>

            </div><!-- #header -->

            <div id="main">
                <div id="forbottom">
                    <div id="container">
                        <div id="content" role="main">


                            <g:layoutBody/>




                        </div><!-- #content -->
                    </div><!-- #container -->

                    <div style="clear:both;"></div>
                </div> <!-- #forbottom -->
            </div><!-- #main -->


            <div id="footer" role="contentinfo">
                <div id="colophon"></div>
                <div id="site-info">
                    <a href="http://www.yakoobahmad.com/" target="_blank" title="Zombie Invasion"> ZombieInvasion.global is powered by Yakoob Ahmad </a>
                </div><!-- #site-info -->
            </div><!-- #footer -->


        </div><!-- #wrapper -->
    </div><!-- #splatter -->
</div><!-- #topper -->

</body>
</html>
