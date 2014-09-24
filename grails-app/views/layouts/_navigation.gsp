<g:set var="ni" value="${params["ni"]}" scope="request"/>

<div class="menu">
    <ul>
        <%--- current_page_item ---%>
        <li class="${ ni == "home" ? 'current_page_item':'page_item' }"><a href="/?ni=home">Home</a></li>
        `
        <li class="${ ni == "map" ? 'current_page_item':'page_item' } page-item-1"><a href="/map?ni=map">Invasion Map</a></li>

        <%-- <li class="${ ni == "city" ? 'current_page_item':'page_item' } page-item-2"><a href="/city?ni=city">Invaded Cities</a></li> --%>

        <li class="${ ni == "account" ? 'current_page_item':'page_item' } page-item-3 page_item_has_children"><a href="/account?ni=account">Account</a></li>
    </ul>
</div>