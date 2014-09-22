<div class="menu">
    <ul>
        <%--- current_page_item ---%>
        <li class="page_item"><a href="/">Home</a></li>


        <li class="page_item page-item-1"><a href="/map">Invasion Map</a></li>

        <li><a href="/city/1" class="fa fa-comment comment-popup">city</a></li>

        <li class="page_item page-item-3 page_item_has_children"><a href="/account">Account</a>
            <g:if test="!${isloggedin}">
                <ul class="children" style="visibility: hidden;">
                    <li class="page_item page-item-4"><a href="/login">Login</a></li>
                    <li class="page_item page-item-5"><a href="/register">Register</a></li>
                </ul>
            </g:if>
        </li>
    </ul>
</div>