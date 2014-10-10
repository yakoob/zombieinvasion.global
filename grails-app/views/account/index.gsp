<!DOCTYPE html>

<html>

<head>
    <meta name='layout' content='main'/>
</head>

<body>

<div class="jumbotron jumbotron2">
<div style="background:url(${assetPath(src: 'widget.jpg')}) right top no-repeat;">
<sec:ifLoggedIn>

    <span style="float: right;"><g:link uri="/j_spring_security_logout"><button type="button" class="btn btn-danger">Logout</button></g:link></span>
    <g:render template="/account/details" model="[sighting:sighting, undeadStories:undeadStories, otherSightings:otherSightings]"></g:render>


</sec:ifLoggedIn>
<sec:ifNotLoggedIn>

    <div class="page-header">
        <h1>Signing with Twitter... <small>Simply login with your Twitter account by clicking the link below.</small></h1>
    </div>

    <div class="message">Not authenticated</div>
    <div style="width:500px"><twitterAuth:button /></div>

</sec:ifNotLoggedIn>

</div>
</div>


</body>

</html>
