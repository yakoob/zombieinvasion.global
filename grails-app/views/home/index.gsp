<!DOCTYPE html>

<html>

<head>

    <meta name='layout' content='main'/>

    <script>
        mainLayoutApi.setPageContentId("content-inner");
        mainLayoutApi.setPageContentUri("blog");
        mainLayoutApi.loadPage("content", "blog");
    </script>

</head>

<body>
<g:if test="${askForEmail}">
    <script>
    $(document).ready(function() {
        console.log("give me your email");
    });
    </script>
</g:if>
<div id="forbottom">

    <div id="container">
        <div id="content" role="main">
            ... loading content ...
        </div><!-- #content -->
    </div><!-- #container -->

    <div id="primary" class="widget-area" role="complementary">

        <ul class="xoxo">

            <h3 class="widget-title">Infected Populations</h3>

            <div class="pagination">
                <g:paginate controller="home" maxsteps="7" omitNext="true" omitPrev="true" action="index" total="${cityCount}" />
            </div>


            <li id="search" class="widget-container widget_search">
                <input type="text" value="Search" name="s" id="s" onblur="if (this.value == &#39;&#39;)
                {this.value = &#39;Search&#39;;}" onfocus="if (this.value == &#39;Search&#39;)
                {this.value = &#39;&#39;;}">
                <input type="submit" id="searchsubmit" value="">
            </li>

            <div style="clear:both;"></div>

            <table>
                <tr>
                    <td><b>Infected</b></td>
                    <td>&nbsp;&nbsp;&nbsp;</td>
                    <td><b>City</b></td>
                </tr>
                <g:each in="${cities}">
                <tr>
                    <td style="white-space: nowrap; vertical-align: top">(2 / <g:formatNumber number="${it.population}" format="###,##0" />)</td>
                    <td>&nbsp;</td>
                    <td><a href="#">${it.city}</a></td>
                </tr>
                </g:each>
            </table>

        </ul>

    </div>

    <div style="clear:both;"></div>

</div> <!-- #forbottom -->


</body>

</html>
