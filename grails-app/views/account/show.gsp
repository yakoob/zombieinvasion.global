<!DOCTYPE html>

<html>

<head>
    <meta name='layout' content='none'/>
</head>

<body>


<div class="row">

    <div class="col-sm-6 col-md-4" >
        <div class="thumbnail">

            <h3 style="color: #A94442; text-align: center">${sighting.user.username}</h3>
            <img src="${assetPath(src: 'zi_icon_zombie_overlord.png')}" width="100">
            <div class="caption">
                <p>${raw(sighting.city.country.displayFlag())} ${sighting.city.city}, ${sighting.city?.region?.description} @ <g:formatDate format="MM/dd/yyyy hh:mm:ss a z" date="${sighting.lastUpdated}"/></p>
            </div>
        </div>
    </div>


    <div class="panel panel-danger">
        <!-- Default panel contents -->
        <div class="panel-heading"><b>UnDead Stories</b></div>



            <g:each in="${undeadStories}" var="i">

                <p style="padding-top: 5px"><span class="glyphicon glyphicon-log-in"></span> <a href="${createLink(uri: "/blogs/${i.id}")}" class="btn btn-danger" role="button"><span class="glyphicon glyphicon-info-sign"></span> ${i.subject} | <span class="glyphicon glyphicon-thumbs-up"></span> likes <span class="badge">${i.likes.size()}</span> | Comments <span class="badge">${i.comments.size()}</span></a></p>

            </g:each>

    </div>


    <div class="panel panel-danger">
        <!-- Default panel contents -->
        <div class="panel-heading"><b>Other Sightings</b></div>

        <g:each in="${region.UndeadSighting.findAllByUser(sighting.user)}" var="s">

            <g:if test="${s.id != sighting.id}">
                <p>${raw(s.city.country.displayFlag())} ${s.city.city}, ${s.city?.region?.description} @ <g:formatDate format="MM/dd/yyyy hh:mm:ss a z" date="${s.lastUpdated}"/></p>
            </g:if>

        </g:each>

    </div>

</div>


</body>

</html>
