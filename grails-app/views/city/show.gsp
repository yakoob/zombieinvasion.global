<!DOCTYPE html>

<html>

<head>
    <meta name='layout' content='none'/>
</head>

<body>

<div class="panel panel-danger">
    <!-- Default panel contents -->
    <div class="panel-heading">${raw(city.country?.displayFlag())} ${city.city}, ${city?.region?.description}</div>

    <div class="panel-body">

        <g:each in="${sightings}" var="sighting">

            <div class="col-sm-3 col-md-4" >
                <div class="thumbnail">
                    <a class="ajax" href="${createLink(uri: "/zombie/${sighting.user.id}")}">
                    <h3 style="color: #A94442; text-align: center">
                        ${sighting.user.username}
                    </h3>
                    <img src="${assetPath(src: "${sighting.user.icon.path}")}" width="130">
                    <center><span class="badge">${sighting?.user?.displayRank}</span></center>
                    </a>
                    <div class="caption">
                        <div class="panel panel-danger">
                            <div class="panel-heading">
                                <center><span class="badge">${sighting.user.score}</span> <b>Score</b></center>

                            </div>
                            <div class="panel-body">
                                <p>${raw(sighting.city.country.displayFlag())} ${sighting.city.city}, ${sighting.city?.region?.description} @ <g:formatDate format="MM/dd/yyyy hh:mm:ss a z" date="${sighting.lastUpdated}"/></p>
                            </div>

                        </div>

                    </div>
                </div>
            </div>


        </g:each>
    </div>
</div>


</body>

</html>
