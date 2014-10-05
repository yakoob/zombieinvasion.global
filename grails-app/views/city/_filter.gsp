<g:javascript plugin="remote-pagination" library="remoteNonStopPageScroll"/>

<g:each in="${contents}" var="it" status="index">


            <li class="list-group-item">
                <span class="badge"><g:formatNumber number="${it.population}" format="###,##0" /></span>
                <a class="ajax" href="shout">${it.city}, ${it.countryCode}</a>
            </li>




</g:each>

<util:remoteNonStopPageScroll action="list" controller="city"  total="${total}" update="city_content" loadingHTML="loadingDivId"/>