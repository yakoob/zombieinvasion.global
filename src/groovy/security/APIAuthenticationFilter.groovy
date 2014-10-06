package security

import org.springframework.beans.factory.InitializingBean
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.context.ApplicationEventPublisherAware;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
import org.springframework.security.core.Authentication
import org.springframework.security.core.AuthenticationException
import org.springframework.security.web.authentication.*

import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.web.filter.GenericFilterBean

import javax.servlet.FilterChain
import javax.servlet.ServletException
import javax.servlet.ServletRequest
import javax.servlet.ServletResponse
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @class APIAuthenticationFilter
 * @brief This class adds a filter to handle URLs where the API credentials
 * are supplied with the REST request
 *
 */
class APIAuthenticationFilter {


    def rememberMeServices



    protected void onSuccessfulAuthentication(HttpServletRequest request, HttpServletResponse response, Authentication authResult) {
        SecurityContextHolder.getContext().setAuthentication(authResult)
        rememberMeServices.onLoginSuccess(request, response, authResult)
        println "i was succdsssssdfasdf"
    }


}