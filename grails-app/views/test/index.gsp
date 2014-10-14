<!DOCTYPE html>
<html>
<head>
  <meta name="layout" content="main"/>

  <asset:javascript src="jquery" />
  <asset:javascript src="spring-websocket" />

  <script type="text/javascript">
    $(function() {



      setTimeout(function(){

        client.subscribe("/topic/hello", function(message) {
          $("#helloDiv").append(JSON.parse(message.body));
        });


      }, 2000);





      $("#helloButton").click(function() {
        client.send("/app/hello", {}, JSON.stringify("this is sparta"));
      });

    });
  </script>
</head>
<body>
<button id="helloButton">hello</button>
<div id="helloDiv"></div>
</body>
</html>