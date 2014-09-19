<!DOCTYPE html>

<html>

<head>
    <meta name='layout' content='main'/>

    <title>${raw(blog.subject)}</title>

</head>

<body>


    <article class="is-post is-post-excerpt">
        <header>

            <h2>${raw(blog.subject)}</h2>

            <span class="byline">${raw(blog.title)}</span>

            <g:render template="/blog/blogCategories" model="[categories:blog.categories]"/>

        </header>


        <div class="info">

            <span class="date"><span class="month">${blog.created.monthOfYear().asShortText}</span> <span class="day">${blog.created.dayOfMonth().asText}</span><span class="year">, ${blog.created.year().asText}</span></span>

            <ul class="stats">
                <li><a href="/BlogComment?blogId=${blog.id}" class="fa fa-comment comment-popup">${blog.comments.size()}</a></li>
                <li><a href="#" class="fa fa-heart">32</a></li>
                <li><a href="#" class="fa fa-twitter">64</a></li>
                <li><a href="#" class="fa fa-facebook">128</a></li>
            </ul>

        </div>
        ${raw(blog.body)}
    </article>


</body>

</html>

