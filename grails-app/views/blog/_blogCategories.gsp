<g:if test="${categories.size()>0}">
    <li style="padding-top: 10px"><span class="glyphicon glyphicon-tags"></span>&nbsp;&nbsp;Tags:</li>
    <g:each in="${categories}" var="category">
        <li><a style="color: #99090A" class="disabled">${category.tag}</a></li>
    </g:each>
</g:if>