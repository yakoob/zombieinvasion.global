<g:javascript plugin="remote-pagination" library="remoteNonStopPageScroll"/>

<g:each in="${contents}" var="it" status="index">

    <li class="list-group-item">
        <span class="badge"><g:formatNumber number="${it.populationInfected}" format="###,##0" /></span>
        ${raw(it.country.displayFlag())}
        <a class="ajax" href="shout">${it.city} <g:if test="${it.region?.description}">, ${it.region?.description}</g:if></a>
    </li>

</g:each>

<util:remoteNonStopPageScroll action="list" controller="city"  total="${total}" update="city_content" loadingHTML="loadingDivId"/>