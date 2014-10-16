<!DOCTYPE html>

<html>

<head>
    <meta name='layout' content='main'/>
</head>


<body>

<div class="jumbotron jumbotron2">
    <div>

            <p><b>Tell the world your UnDead Story...</b></p>

            <p><b>Points are accumulated which determine your zombie rank as follows:</b></p>

            <ul class="list-group-item-danger" style="width: 50%">
                <li class="list-group-item">
                    <span class="badge">10</span>
                    Each UnDead Story told
                </li>
                <li class="list-group-item">
                    <span class="badge">1</span>
                    When other zombies like your Undead Story
                </li>
                <li class="list-group-item">
                    <span class="badge">2</span>
                    When other zombies comment your Undead Story
                </li>
                <%---
                <li class="list-group-item">
                    <span class="badge">50-2000</span>
                    When a <a class="ajax" href="${createLink(uri: "/payment")}"><b>donation</b></a> is made
                </li>
                ---%>
            </ul>



            <div class="row" style="background:url(${assetPath(src: 'widget.jpg')}) right top no-repeat;">
                <div class="col-sm-6 col-md-4"  style="background:url(${assetPath(src: 'widget.jpg')}) right top no-repeat;">
                    <div class="thumbnail">
                        <img src="${assetPath(src: 'zi_icon_viral_zombie.png')}" style="height: 100px; display: block;">
                        <div class="caption">
                            <center><p><b>Viral Zombie</b></p><span class="badge">50 Points</span></center>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-4" style="background:url(${assetPath(src: 'widget.jpg')}) right top no-repeat;">
                    <div class="thumbnail">
                        <img src="${assetPath(src: 'zi_icon_zombie_king.png')}" style="height: 100px; display: block;">
                        <div class="caption">
                            <center><p><b>Zombie King</b></p><span class="badge">100 Points</span></center>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6 col-md-4" style="background:url(${assetPath(src: 'widget.jpg')}) right top no-repeat;">
                    <div class="thumbnail">
                        <img src="${assetPath(src: 'zi_icon_iscream_zombie.png')}" style="height: 100px; display: block;">
                        <div class="caption">
                            <center><p><b>IScream Zombie</b></p><span class="badge">300 Points</span></center>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6 col-md-4" style="background:url(${assetPath(src: 'widget.jpg')}) right top no-repeat;">
                    <div class="thumbnail">
                        <img src="${assetPath(src: 'zi_icon_blood_zombie.png')}" style="height: 100px; display: block;">
                        <div class="caption">
                            <center><p><b>Blood Zombie</b></p><span class="badge">500 Points</span></center>
                        </div>
                    </div>
                </div>


                <div class="col-sm-6 col-md-4" style="background:url(${assetPath(src: 'widget.jpg')}) right top no-repeat;">
                    <div class="thumbnail">
                        <img src="${assetPath(src: 'zi_icon_zombie_overlord.png')}" style="height: 100px; display: block;">
                        <div class="caption">
                            <center><p><b>Zombie Overlord</b></p><span class="badge">1000 Points</span></center>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6 col-md-4" style="background:url(${assetPath(src: 'widget.jpg')}) right top no-repeat;">
                    <div class="thumbnail">
                        <img src="${assetPath(src: 'zi_icon_nuclear_zombie.png')}" style="height: 100px;">
                        <div class="caption">
                            <center><p><b>Nuclear Zombie</b></p><span class="badge">2000 Points</span></center>
                        </div>
                    </div>
                </div>


            </div>





</div>


</body>

</html>
