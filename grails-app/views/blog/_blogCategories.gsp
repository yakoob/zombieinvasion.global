<g:if test="${categories.size()>0}">
    <li style="padding-top: 10px"><span class="glyphicon glyphicon-tags"></span>&nbsp;&nbsp;Tags:</li>
    <g:each in="${categories}" var="category">
        <li><a href="javascript:mainLayoutApi.loadPage('body-content', 'blog/search?categories=${category.tag}')">${category.tag}</a></li>
    </g:each>
</g:if>