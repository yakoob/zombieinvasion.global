<%@ page import="org.springframework.http.HttpStatus" %>

<a href='account?ni=account'>
    <button class="btn btn-lg btn-danger">
        <span class="glyphicon glyphicon-lock"></span> ${org.springframework.http.HttpStatus.UNAUTHORIZED.name()}: login to unlock this feature
    </button>
</a>
