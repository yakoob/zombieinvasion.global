<!DOCTYPE html>

<html>

<head>
    <meta name='layout' content='singleColumn'/>
</head>

<body>
<div id="page-body" role="main">
    <h1>Login</h1>
    <p></p>
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
        <div class="message">Not authenticated</div>
        <twitterAuth:button />
    </sec:ifNotLoggedIn>
</div>
</body>

</html>
