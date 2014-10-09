<%---TODO http://jawj.github.io/OverlappingMarkerSpiderfier/demo.html ---%>

<html>
<head>
    <title>Invasion Map - Track the global outbreak in real-time.</title>
    <meta name="layout" content="singleColumn" />

    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script>


    <script type="text/javascript">

        var map;
        var NANTES_FRANCE = new google.maps.LatLng(47.21725, -1.55336);

        var MY_MAPTYPE_ID = 'custom_style';

        function initialize() {

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

            var mapOptions = {
                zoom: 2,
                center: NANTES_FRANCE,
                mapTypeControlOptions: {
                    mapTypeIds: [google.maps.MapTypeId.ROADMAP, MY_MAPTYPE_ID]
                },
                mapTypeId: MY_MAPTYPE_ID
            };

            map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

            var styledMapOptions = {
                name: 'Custom Style'
            };

            var customMapType = new google.maps.StyledMapType(featureOpts, styledMapOptions);

            map.mapTypes.set(MY_MAPTYPE_ID, customMapType);

            setTimeout();

        }



        function addMarker(id, latitude, longitude){

            var image = "${assetPath(src: 'zi_icon_zombie_overlord_marker.png')}";

            var myLatLng = new google.maps.LatLng(latitude, longitude);

            var marker = new google.maps.Marker({
                position: myLatLng,
                map: map,
                icon: image,
                id:id

            });

            google.maps.event.addListener(marker, 'click', function() {
                var zombieLink = "${createLink(uri: '/zombie/')}" + marker.id;
                $.colorbox({href:zombieLink,innerWidth:"30%",innerHeight:"30%"})
            });

        }

        setTimeout(function() {

            <g:each in="${undeadSightings}" var="sighting">
            addMarker(${sighting.id}, ${sighting.latitude}, ${sighting.longitude});
            </g:each>

        }, 3000);





        google.maps.event.addDomListener(window, 'load', initialize);

    </script>
</head>
<body>
<div id="map-canvas" style="width:100%; height:700px">
</div>
</body>
</html>

<%---

<ul class="nav nav-pills">
    <li>
        <a href="#" onclick="addMarker('-33.83333','151.01667')">
            <span class="badge pull-right">21</span>
            Epping
        </a>
    </li>

    <li>
        <a href="#" onclick="addMarker('-34.06564','151.01266')">
            <span class="badge pull-right">56</span>
            Engadine
        </a>
    </li>

    <li>
        <a href="#" onclick="addMarker('-32.18136','152.51715')">
            <span class="badge pull-right">2</span>
            Forster
        </a>
    </li>

</ul>
---%>