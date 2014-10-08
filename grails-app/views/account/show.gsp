<!DOCTYPE html>

<html>

<head>
    <meta name='layout' content='none'/>
</head>

<body>



<h2>${sighting.user.username} was seen on <g:formatDate format="MM/dd/yyyy hh:mm:ss a z" date="${sighting.lastUpdated}"/> in ${raw(sighting.city.country.displayFlag())} ${sighting.city.city}, ${sighting.city.regionCode}</h2>
<h2>Undead Stories</h2>
<g:if test="${undeadStories}">
    <g:each in="${undeadStories}" var="i">
        ${i.likes.size()} ${i.title}
    </g:each>
</g:if>
<g:else>
    <h4>no UnDead Stories found...</h4>
</g:else>

<h2>Other Sightings</h2>
<g:each in="${region.UndeadSighting.findAllByUser(sighting.user)}" var="s">

    <g:if test="${s.id != sighting.id}">
        <h4><g:formatDate format="M.d.yy h:mm:ss a z" date="${s.lastUpdated}"/> ${raw(s.city.country.displayFlag())} ${s.city.city}, ${s.city.regionCode}</h4>
    </g:if>

</g:each>



</body>

</html>
