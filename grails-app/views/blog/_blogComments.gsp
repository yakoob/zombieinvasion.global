<style>
#comment_section {
    position: relative;
    background: #FFF;
    padding: 20px;
    width: auto;
    max-width: 80%;
    margin: 20px auto;
}
</style>

<div id="comment_section">


<g:if test="${!comments.size()}">
    <article class="is-post is-post-excerpt">
        <header>
            <h1>no comments yet...</h1>
        </header>
    </article>

</g:if>


<g:each in="${comments}">

    <h1>${raw(it.comment)}</h1>

</g:each>
</div>

