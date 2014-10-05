<!DOCTYPE html>

<html>

<head>
    <meta name='layout' content='main'/>
</head>

<body>

<div class="jumbotron">

<sec:ifLoggedIn>

    <div class="message">Authenticated</div>
    Hello <sec:username/>!
    <hr/>
    <h2>Details</h2>
    <table>
        <tr>
            <td>Username:</td>
            <td><sec:loggedInUserInfo field="username"/></td>
        </tr>
        <tr>
            <td>Roles:</td>
            <td><sec:loggedInUserInfo field="authorities"/></td>
        </tr>
    </table>
    <g:link uri="/j_spring_security_logout">Logout</g:link>
</sec:ifLoggedIn>
<sec:ifNotLoggedIn>

    <div class="page-header">
        <h1>Signing with Twitter... <small>Simply login with your Twitter account by clicking the link below.</small></h1>
    </div>

    <div class="message">Not authenticated</div>
    <div style="width:500px"><twitterAuth:button /></div>

</sec:ifNotLoggedIn>


</div>


</body>

</html>
