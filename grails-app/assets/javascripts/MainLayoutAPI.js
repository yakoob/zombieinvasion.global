var MainLayoutAPI = function(){

    var pageContentId
    var pageContentUri

    function init(){
        executeLayout();
    }

    function executeLayout(){
        menu();
        // searchListener();
        // webSocketListener();
        colorBox();
    }

    function webSocketListener(topic){
        // var topic = '/topic/random_quotes';
        var topic = '/topic/random_quotes';
        var socket = new SockJS("/stomp");
        var client = Stomp.over(socket);
        client.connect({}, function() {
            client.subscribe(topic, function(message) {
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
            loadPage('body-content','blog/search?searchPhrase=' + existingString);
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
                $('#body-content').html('');
                // add rest response data to body
                $(data).appendTo('#body-content');
            }
        });

    }

    function setPageContentId(id){
        pageContentId = id;
    }

    function setPageContentUri(uri){
        pageContentUri = uri;
    }

    function colorBox(){
        $(document).ready(function(){
            // $(".ajax").colorbox({rel:'group3', transition:"none", width:"50%", height:"50%"});

            $(".ajax").colorbox({
                width:"70%",
                height:"70%"
                /*
                ,
                onOpen:function(){ console.log('onOpen: colorbox is about to open'); },
                onLoad:function(){ console.log('onLoad: colorbox has started to load the targeted content'); },
                onComplete:function(){ console.log('onComplete: colorbox has displayed the loaded content'); },
                onCleanup:function(){ console.log('onCleanup: colorbox has begun the close process'); },
                onClosed:function(){ console.log('onClosed: colorbox has completely closed'); }
                */
            });


        });
    }

    jQuery(document).ready(function(){
        $(document).bind('cbox_open', function() {
            $('html').css({ overflow: 'hidden' });
        }).bind('cbox_closed', function() {
            $('html').css({ overflow: '' });
        });
    });


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
