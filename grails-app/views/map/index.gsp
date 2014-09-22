<html>
<head>
    <title>Invasion Map - Track the global outbreak in real-time.</title>
    <meta name="layout" content="singleColumn" />


    <script type="text/javascript" src="/js/jquery.min.js"></script>

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

            map = new google.maps.Map(document.getElementById('map-canvas'),
                    mapOptions);

            var styledMapOptions = {
                name: 'Custom Style'
            };

            var customMapType = new google.maps.StyledMapType(featureOpts, styledMapOptions);

            map.mapTypes.set(MY_MAPTYPE_ID, customMapType);

            // To add the marker to the map, call setMap();
            marker.setMap(map);



        }

        google.maps.event.addDomListener(window, 'load', initialize);



        function addMarker(latitude, longitude){
            var image = "/images/zombie_marker.png";

            var myLatLng = new google.maps.LatLng(latitude, longitude);
            var marker = new google.maps.Marker({
                position: myLatLng,
                map: map,
                icon: image,
                url: "/shout"
            });

            google.maps.event.addListener(marker, 'click', function() {
                window.location.href = this.url;
            });

        }


    </script>
</head>
<body>


<a onclick="addMarker('-33.83333','151.01667')">Epping</a>
 |
<a onclick="addMarker('-34.06564','151.01266')">Engadine</a>
 |
<a onclick="addMarker('-32.18136','152.51715')">Forster</a>
<hr>


population: 4000 | infected 20
<div id="map-canvas" style="width:900px; height:700px">
</div>
</body>
</html>
