var MainLayoutAPI = function(){

    var pageContentId
    var pageContentUri

    function init(){
        console.log("in init");
        // Give Modernizr.load a string, an object, or an array of strings and objects

        executeLayout();

    }

    function executeLayout(){
        menu();
        // searchListener();
        // webSocketListener();
        magnificPopup();
    }

    function webSocketListener(){
        var topic = '/topic/random_quotes';
        var socket = new SockJS("/stomp");
        var client = Stomp.over(socket);
        client.connect({}, function() {
            client.subscribe(topic, function(message) {
                console.log(message);
                if (message.body) {
                    $("#quoteMsgDiv").html(message.body);
                }
            });
        });

    }

    function searchListener(){

        $('#blog_search').keyup(function(e) {
            clearTimeout($.data(this, 'timer'));
            if (e.keyCode == 13)
                search(true);
            else
                $(this).data('timer', setTimeout(search, 500));
        });
        function search(force) {
            var existingString = $("#blog_search").val();
            if (!force && existingString.length < 3) return; //wasn't enter, not > 2 char
            loadPage('content-inner','blog/search?searchPhrase=' + existingString);
        }

        $(document).ready(function() {
            $(window).keydown(function(event){
                if(event.keyCode == 13) {
                    event.preventDefault();
                    return false;
                }
            });
        });


    }

    function loadPage(a, b){

        setPageContentId(a);
        setPageContentUri(b);

        var uri = pageContentUri.replace("#", "/");

        $.ajax({
            url: uri,
            type: "get",
            dataType: "html",
            success: function (data) {
                // clear current body content
                $('#content').html('');
                // add rest response data to body
                $(data).appendTo('#content');
            }
        });

    }

    function setPageContentId(id){
        pageContentId = id;
    }

    function setPageContentUri(uri){
        pageContentUri = uri;
    }

    function magnificPopup(){
        $('.comment-popup').magnificPopup({
            type: 'ajax',
            alignTop: true,
            overflowY: 'scroll' // as we know that popup content is tall we set scroll overflow by default to avoid jump
        });
    }

    function menu(){
        jQuery(document).ready(function() {
            jQuery("#access ul ul").css({display: "none"}); // Opera Fix
            jQuery("#access li").hover(function(){
                jQuery(this).find('ul:first').css({visibility: "visible",display: "none"}).show(250);
            },function(){
                jQuery(this).find('ul:first').css({visibility: "hidden"});
            });
        });
    }

    return {
        init:init,
        setPageContentId:setPageContentId,
        setPageContentUri:setPageContentUri,
        loadPage:loadPage,
        searchListener:searchListener,
        webSocketListener:webSocketListener
    }


}


var mainLayoutApi = new MainLayoutAPI();
mainLayoutApi.init();