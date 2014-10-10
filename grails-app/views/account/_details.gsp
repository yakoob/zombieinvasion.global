
<div class="row">

    <div class="col-sm-3 col-md-4" >
        <div class="thumbnail">

            <h3 style="color: #A94442; text-align: center">${sighting.user.username}</h3>
            <img src="${assetPath(src: "${sighting.user.icon.path}")}" width="130">
            <center><span class="badge">${sighting?.user?.displayRank}</span></center>
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

    <div class="col-sm-7 col-md-7" >

        <div class="panel panel-danger">
            <!-- Default panel contents -->
            <div class="panel-heading"><span class="badge">${undeadStories.size()}</span> <b>Dead Stories</b></div>

            <ul class="list-group">
                <g:each in="${undeadStories}" var="i">
                    <li class="list-group-item">
                        <span class="glyphicon glyphicon-log-in"></span> <a href="${createLink(uri: "/blogs/${i.id}")}">${i.subject}</a>
                        <span class="badge"><span class="glyphicon glyphicon-thumbs-up"></span> likes ${i.likes.size()}</span>
                        <div>&nbsp;</div>
                    </li>

                </g:each>
            </ul>

        </div>


        <div class="panel panel-danger">
            <!-- Default panel contents -->
            <div class="panel-heading"><span class="badge">${otherSightings.size()-1}</span> <b>Other Sightings</b></div>

            <ul class="list-group">
                <g:each in="${otherSightings}" var="s">
                    <g:if test="${s.id != sighting.id}">
                        <li class="list-group-item">
                            ${raw(s.city.country.displayFlag())} ${s.city.city}, ${s.city?.region?.description} @ <g:formatDate format="MM/dd/yyyy hh:mm:ss a z" date="${s.lastUpdated}"/>
                        </li>
                    </g:if>
                </g:each>
            </ul>

        </div>

    </div>
</div>
