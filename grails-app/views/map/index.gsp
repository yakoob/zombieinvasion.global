<html>

<head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />

    <meta name="description" content="Zombie Invasion Global, Chipping in on Bite at a time. The social network for zombies, zombie walks and all things Zombie..."/>
    <meta name="keywords" content="zombie invasion,zombie walk,zombie flashmob,flash mob,zombies,living dead,undead,walking dead,dead,dawn of the dead,social network" />

    <link rel="canonical" href="http://zombieinvasion.global/"/>
    <link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
    <link rel="icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">

    <asset:javascript src="jquery.min.js"/>
    <asset:javascript src="Modernizr.js"/>
    <asset:stylesheet src="colorbox.css"/>
    <asset:javascript src="jquery.colorbox-min.js"/>
    <asset:stylesheet src="bootstrap.min.css"/>
    <asset:stylesheet src="bootstrap-theme.min.css"/>
    <asset:stylesheet src="style.css"/>
    <asset:javascript src="bootstrap.min.js"/>
    <asset:javascript src="MainLayoutAPI.js"/>

    <script>
        var mainLayoutApi = new MainLayoutAPI();
        mainLayoutApi.init();
    </script>

    <style>
        html { height: auto; }
        body { height: auto; margin: 0; padding: 0;}
        table { border-collapse: collapse; border-spacing: 0; }
        #map_canvas { height: auto; position: absolute; bottom: 0; left: 0; right: 0; top: 170px; }
        @media print { #map_canvas { height: 100%; } }
    </style>

    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script>

    <asset:javascript src="oms.js"></asset:javascript>

    <script>
        window.onload = function() {

            var MY_MAPTYPE_ID = 'custom_style';
            var NANTES_FRANCE = new google.maps.LatLng(47.21725, -1.55336);
            var gm = google.maps;

            var featureOpts = [
                {
                    stylers: [
                        { hue: '#890000' },
                        { visibility: 'simplified' },
                        { gamma: 0.8 },
                        { weight: 0.1 }
                    ]
                },
                {
                    elementType: 'labels',
                    stylers: [
                        { visibility: 'on' }
                    ]
                },
                {
                    featureType: 'water',
                    stylers: [
                        { color: '#890000' }
                    ]
                }
            ];

            var styledMapOptions = {
                name: 'Custom Style'
            };

            var customMapType = new google.maps.StyledMapType(featureOpts, styledMapOptions);

            var map = new gm.Map(document.getElementById('map_canvas'), {
                mapTypeId: MY_MAPTYPE_ID,
                center: NANTES_FRANCE,
                zoom: 2,
                scrollwheel: true
            });

            map.mapTypes.set(MY_MAPTYPE_ID, customMapType);

            var iw = new gm.InfoWindow();
            var oms = new OverlappingMarkerSpiderfier(map,
                    {markersWontMove: false, markersWontHide: true});

            var usualColor = 'eebb22';
            var spiderfiedColor = 'ffee22';
            var iconWithColor = function(color, icon) {
                return icon;
            }
            var shadow = new gm.MarkerImage(

                    new gm.Size(37, 34),  // size   - for sprite clipping
                    new gm.Point(0, 0),   // origin - ditto
                    new gm.Point(10, 34)  // anchor - where to meet map location
            );

            oms.addListener('click', function(marker) {
                iw.setContent(marker.desc);
                iw.open(map, marker);

                var zombieLink = "${createLink(uri: '/zombie/')}" + marker.zid;

                $.colorbox({href:zombieLink,innerWidth:"50%",innerHeight:"50%"})

            });
            oms.addListener('spiderfy', function(markers) {
                for(var i = 0; i < markers.length; i ++) {

                    markers[i].setIcon(iconWithColor(spiderfiedColor, markers[i].zion));
                    markers[i].setShadow(null);
                }
                iw.close();
            });
            oms.addListener('unspiderfy', function(markers) {
                for(var i = 0; i < markers.length; i ++) {

                    markers[i].setIcon(iconWithColor(usualColor, markers[i].zion));
                    markers[i].setShadow(shadow);
                }
            });

            var bounds = new gm.LatLngBounds();
            for (var i = 0; i < window.mapData.length; i ++) {
                var datum = window.mapData[i];
                var loc = new gm.LatLng(datum.lat, datum.lon);
                bounds.extend(loc);
                var marker = new gm.Marker({
                    position: loc,
                    title: datum.h,
                    map: map,
                    icon: iconWithColor(usualColor, datum.zion),
                    shadow: shadow
                });
                marker.desc = datum.d;
                marker.zid = datum.zid;
                marker.zion = datum.zion;
                oms.addMarker(marker);
            }
            map.fitBounds(bounds);

            window.map = map;
            window.oms = oms;
        }
    </script>
</head>

<body>

<div id="topper">

    <div id="splatter">

        <div id="wrapper">

            <div id="header">

                <h1 id="site-title">
                    <span>
                        <a href="${createLink(uri: '/home?ni=home')}" title="ZombieInvasion.global" rel="${createLink(uri: '/home?ni=home')}">Zombie Invasion</a>
                    </span>
                </h1>

                <div id="site-description">Chipping in one Bite at a time...</div>

                <div style="float: right; padding: 0 0 0 0; margin: 0 0 0 0;">
                    <a href="https://twitter.com/UnDead_zZz" class="twitter-follow-button" data-show-count="false" data-size="large">Follow @UnDead_zZz</a>
                    <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>
                </div>

                <g:render template="/layouts/navigation"/>

            </div><!-- #header -->


            <div class="container">

                <div class="row row-offcanvas row-offcanvas-right">

                    <div id="map_canvas"></div>

                </div><!--/row-->

                <div id="footer" role="contentinfo">
                    <div id="colophon"></div>
                    <div id="site-info">
                        <a href="http://www.yakoobahmad.com/" target="_blank" title="Zombie Invasion"> ZombieInvasion.global is powered by Yakoob Ahmad </a>
                    </div><!-- #site-info -->
                </div><!-- #footer -->


            </div><!--/.container-->

        </div>
    </div>
</div>

<script>

    var rnd = Math.random;
    var data = [];

    var clusterSizes = [1];

    <g:each in="${undeadSightings}" var="sighting">

    baseLon = ${sighting.longitude};
    baseLat = ${sighting.latitude};
    var icon = '${assetPath(src: "${sighting.user.icon.markerPath}")}';

    data.push({
        lon: baseLon,
        lat: baseLat,
        h:   "${sighting.user.username} seen on ${sighting.created.toString()}",
        d:   "${sighting.user.username}'s score: "+${sighting.user.score},
        zid: ${sighting.id},
        zion: icon
    });

    </g:each>

    window.mapData = data;
</script>

</body>

</html>