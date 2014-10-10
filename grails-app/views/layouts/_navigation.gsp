<g:set var="ni" value="${params["ni"]}" scope="request"/>

<g:if test="${params['ni'] == null}">
    <g:set var="ni" value="home" scope="request"/>
</g:if>

<ul class="nav nav-pills">
<%---
    <li class="${ ni == "home" ?: 'active'}"><a href="home?ni=home">Home</a></li>
    <li class="${ ni == "map" ?: 'active' } page-item-1"><a href="map?ni=map">Invasion Map <span class="badge">42</span></a></li>
    <li class="${ ni == "account" ?: 'active'}"><a href="account?ni=account">Account</a></li>
---%>
</ul>


<div class="navbar navbar-inverse">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${createLink(uri: '/home?ni=home')}">ZombieInvasion.global</a>
        </div>

        <div class="navbar-collapse collapse">

            <ul class="nav navbar-nav">

                <li class="${ ni == "home" ? 'active':''}"><a href="${createLink(uri: '/home?ni=home')}">Home</a></li>
                <li class="${ ni == "map" ? 'active':''}"><a href="${createLink(uri: '/map?ni=map')}">Invasion Map</a></li>

                <sec:ifLoggedIn>


                    <script>

                        $(document).ready(function() {


                            var socketScore = new SockJS("${createLink(uri: '/stomp')}");

                            var clientScore = Stomp.over(socketScore);

                            var topicScore = '/topic/score/${sec.username()}';


                            clientScore.connect({}, function () {

                                clientScore.subscribe(topicScore, function (message) {

                                    if (message.body) {

                                        $("#account_score").html(message.body)

                                    }
                                });
                            });
                        });
                    </script>


                    <g:set var="score" value="${user.TwitterUser.findByUsername(sec.username()).score}"/>
                    <li class="${ ni == "account" ? 'active':''}"><a class="ajax" href="${createLink(uri: '/account?ni=account')}">Account <span class="badge" id="account_score">${score}</span></a></li>
                </sec:ifLoggedIn>
                <sec:ifNotLoggedIn>
                    <li class="${ ni == "account" ? 'active':''}"><a class="ajax" href="${createLink(uri: '/account?ni=account')}">Account</a></li>
                </sec:ifNotLoggedIn>
                <li class="${ ni == "payment" ? 'active':''}"><a class="ajax" href="${createLink(uri: '/payment')}" title="Please help us keep our servers running...">Donate</a></li>

            </ul>

        </div><!--/.nav-collapse -->

    </div>
</div>

<g:if test="${grailsApplication.config.app.readOnly.toBoolean()}">
<div class="alert alert-danger" role="alert"><asset:image src="zombie.svg" width="40"/> <strong>... Sorry for the inconvenience, but this application is in Read-Only mode while we upgrade our servers to handle the unexpected hoards of zombies...</strong></div>
</g:if>