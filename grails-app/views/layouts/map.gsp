<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />

    <title><g:layoutTitle default="Zombie Invasion | Chipping in one Bite at a time" /></title>

    <meta name="description" content="Zombie Invasion Global, Chipping in on Bite at a time. The social network for zombies, zombie walks and all things Zombie..."/>
    <meta name="keywords" content="zombie invasion,zombie walk,zombie flashmob,flash mob,zombies,living dead,undead,walking dead,dead,dawn of the dead,social network" />

    <link rel="canonical" href="http://www.zombieinvasion.global/"/>
    <link rel="shortcut icon" href="/images/favicon.ico" type="image/x-icon">
    <link rel="icon" href="favicon.ico" type="image/x-icon">

    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/Modernizr.js"></script>

    <script type="text/javascript" src="/js/MainLayoutAPI.js"></script>
    <script>
        var mainLayoutApi = new MainLayoutAPI();
        mainLayoutApi.init();
    </script>

    <link rel="stylesheet" href="/css/style.css" />

    <style type="text/css" id="custom-background-css">body.custom-background { background-image: url('/images/back.jpg'); background-repeat: repeat; background-position: top left; background-attachment: scroll; }</style>
    <style>
    html, body, #map-canvas {
        height: 100%;
        margin: 0px;
        padding: 0px
    }
    </style>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script>
    <script>
        var map;
        var brooklyn = new google.maps.LatLng(40.6743890, -73.9455);

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
                zoom: 3,
                center: brooklyn,
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


            var myLatlng = new google.maps.LatLng(-25.363882,131.044922);

            var marker = new google.maps.Marker({
                position: myLatlng,
                title:"Hello World!"

            });

            // To add the marker to the map, call setMap();
            marker.setMap(map);



        }

        google.maps.event.addDomListener(window, 'load', initialize);





    </script>


    <g:layoutHead/>

</head>

<body class="home blog custom-background">

    <g:layoutBody/>

    <div id="map-canvas"></div>

</body>
</html>




