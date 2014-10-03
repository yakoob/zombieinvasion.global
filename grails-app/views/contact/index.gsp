<html>
<head>
    <title>Invasion Map - Track the global outbreak in real-time.</title>
    <meta name="layout" content="singleColumn" />

</head>
<body>
<article class="is-post is-post-excerpt">


    <div class="info">
        Contact

    </div>
    <!-- added in spring-security-contactus form here as a button for test purposes -->

    <div id="siteContent">


        <div id="contactUsWrapper">
            <div id="contact-area" class="myform" style="width: 29em;">

                <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                </g:if>


                <g:form name="ContactUss" url="[controller:'ContactUs', action:'send']" update="siteContent">



                    <div class="fieldcontain ${hasErrors(bean: contactUs, field: 'name', 'error')} ">
                        <label for="name">
                            <g:message code="name.label" default="My name is" /><br/>
                            <span class="required-indicator">required</span>
                        </label>
                        <g:textField name="name" value="${contactUs?.name}" required="true"/>

                        <g:if test="${hasErrors(bean: contactUs, field: 'name', 'error')}">
                            <div class="errors" style="margin-left: -0.2em;  width: auto; display: inline-block;*zoom: 1;*display: inline;">
                                <g:renderErrors  bean="${contactUs}" as="list" field="name"/>
                            </div>
                        </g:if>

                    </div>


                    <g:if test="${!user }">
                        <div class="fieldcontain ${hasErrors(bean: contactUs, field: 'email', 'error')} ">
                            <label for="email">
                                <g:message code="name.label" default="My email is" /><br/>
                                <span class="required-indicator">required</span>
                            </label>
                            <g:textField name="email" value="${contactUs?.email}"/>
                            <g:if test="${hasErrors(bean: contactUs, field: 'email', 'error')}">
                                <div class="errors" style="margin-left: -0.2em;  width: auto; display: inline-block;*zoom: 1;*display: inline;">
                                    <g:renderErrors  bean="${contactUs}" as="list" field="email"/>
                                </div>
                            </g:if>
                        </div>

                    </g:if>
                    <g:else>
                        <g:hiddenField name="email" value="${usersemail}"/>
                    </g:else>

                    <g:hiddenField name="username" value="${user ?: 'Guest' }"/>


                    <div class="fieldcontain ${hasErrors(bean: contactUs, field: 'subject', 'error')} ">
                        <label for="subject">
                            My website or subject is<br>
                            <span class="required-indicator">required</span>
                        </label>
                        <input type=text name="subject" value="${contactUs?.subject}" size="50"/>
                        <g:if test="${hasErrors(bean: contactUs, field: 'subject', 'error')}">
                            <div class="errors" style="margin-left: -0.2em;  width: auto; display: inline-block;*zoom: 1;*display: inline;">
                                <g:renderErrors  bean="${contactUs}" as="list" field="subject"/>

                            </div>
                        </g:if>
                    </div>



                    <div id="contact-area">

                        <div class="fieldcontain ${hasErrors(bean: contactUs, field: 'message', 'error')} ">
                            <label for="message">
                                Question or Comments<br>

                                <span class="required-indicator">required</span>
                            </label>
                            <textarea class="myform" name="message" rows="10">${contactUs?.message}</textarea>
                            <g:if test="${hasErrors(bean: contactUs, field: 'message', 'error')}">
                                <div class="errors" style="margin-left: -0.2em;  width: auto; display: inline-block;*zoom: 1;*display: inline;">
                                    <g:renderErrors  bean="${contactUs}" as="list" field="message"/>
                                </div>
                            </g:if>
                        </div>


                        <g:if test="${!user }">


                            <div class="fieldcontain ${hasErrors(bean: contactUs, field: 'captcha', 'errro')} ">

                                <label for="captcha"></label>
                                <div class="tbutton">
                                    <%def rn = new Random().nextInt(2245565)%>
                                    <img src="${createLink(controller: 'simpleCaptcha', action: 'captcha')}?${rn}"/> <br/>
                                    <div class="tbutton">Human Verification - Type in characters above</div></div>

                                <g:textField name="captcha"/>

                                <g:if test="${hasErrors(bean: contactUs, field: 'captcha', 'error')}">
                                    <div class="errors" style="margin-left: -0.2em;  width: auto; display: inline-block;*zoom: 1;*display: inline;">
                                        <g:renderErrors  bean="${contactUs}" as="list" field="captcha"/>
                                    </div>
                                </g:if>
                            </div>
                        </g:if>
                    </div>

                    <div class="fieldcontain" >
                        <label for="captcha"></label><br>
                        <g:actionSubmit class="myformsubmit" url="[controller:'ContactUs', action:'send']" update="siteContent"  value="Contact us" />
                    </div>

                </g:form>
            </div>

        </div>

    </div>

</article>


</body>
</html>