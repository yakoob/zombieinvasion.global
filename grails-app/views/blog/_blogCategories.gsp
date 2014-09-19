<g:each in="${categories}" var="category">
    <strong><a href="javascript:mainLayoutApi.loadPage('content-inner', 'blog/search?categories=${category.tag}')">${category.tag}</a></strong>&nbsp;
</g:each>