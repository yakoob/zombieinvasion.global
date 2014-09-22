<g:set var="ni" value="${params["ni"]}" scope="request"/>

<div class="menu">
    <ul>
        <%--- current_page_item ---%>
        <li class="${ ni == "home" ? 'current_page_item':'page_item' }"><a href="/?ni=home">Home</a></li>
        
        <li class="${ ni == "map" ? 'current_page_item':'page_item' } page-item-1"><a href="/map?ni=map">Invasion Map</a></li>

        <li class="${ ni == "city" ? 'current_page_item':'page_item' } page-item-2"><a href="/city?ni=city">Invaded Cities</a></li>

        <li class="${ ni == "account" ? 'current_page_item':'page_item' } page-item-3 page_item_has_children"><a href="/account?ni=account">Account</a>
            <g:if test="!${isloggedin}">
                <ul class="children" style="visibility: hidden;">
                    <li class="page_item page-item-4"><a href="/login?ni=account">Login</a></li>
                    <li class="page_item page-item-5"><a href="/register?ni=account">Register</a></li>
                </ul>
            </g:if>
        </li>
    </ul>
</div>