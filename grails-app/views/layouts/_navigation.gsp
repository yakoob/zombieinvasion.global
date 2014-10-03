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
            <a class="navbar-brand" href="home">ZombieInvasion.global</a>
        </div>

        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">

                <li class="${ ni == "home" ? 'active':''}"><a href="home?ni=home">Home</a></li>
                <li class="${ ni == "map" ? 'active':''}"><a href="map?ni=map">Invasion Map</a></li>

                <li><a href="#about">About</a></li>
                <li class="${ ni == "contact" ? 'active':''}"><a href="contactUs?ni=contact">Contact</a></li>
                <li class="${ ni == "account" ? 'active':''}"><a href="account?ni=account">Account</a></li>

                <%---
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Account <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="login?ni=account">Login</a></li>
                        <li><a href="account?ni=account">Create</a></li>
                        <li><a href="logout?ni=account">Logout</a></li>
                    </ul>
                </li>
                ---%>
            </ul>

        </div><!--/.nav-collapse -->


    </div>
</div>