

<%@ page import="org.sb.fc.User" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
       <title>FCloud</title>
<script>
  $(document).ready(function(){
    $("#editForm").validate({
  rules: {
    password: {
      required: true,
      minlength: 5
    }
  }
});
  });
  </script>
    </head>
    <body>
        <div class="topbar-wrapper" style="z-index: 5;">
		<div class="topbar" data-dropdown="dropdown">
			<div class="topbar-inner">
				<div class="container">
					<h3>
						<a href="#">FCloud</a>
					</h3>
					<ul class="nav">
						<li><a class="active" href="${createLink(uri: '/')}"><g:message
									code="default.home.label" /> </a>
						</li>
						<li><g:link action="create">
								<g:message code="default.new.label" args="[entityName]" />
							</g:link>
						</li>
						<li><g:link controller="user" action="logout">Logout</g:link>
						</li>
					</ul>
					<form class="pull-left" action="">
						<input type="text" placeholder="Search">
					</form>
				</div>
			</div>
			<!-- /topbar-inner -->
		</div>
		<!-- /topbar -->
	</div>
		<div class="container">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${userInstance}">
            <div class="errors">
                <g:renderErrors bean="${userInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" id="editForm" >
                <g:hiddenField name="id" value="${userInstance?.id}" />
                <g:hiddenField name="version" value="${userInstance?.version}" />
                <div class=>
                    <table>
                        <tbody>
                        	 <tr>
                                <td valign="top" >
                                  <label for="username"><g:message code="user.username.label" default="Username" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'username', 'errors')}">
                                    <g:textField name="username" value="${userInstance?.username}" class="required" />
                                </td>
                            </tr>
                            
                             <tr>
                                <td valign="top" >
                                  <label for="email"><g:message code="user.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${userInstance?.email}" class="required email" />
                                </td>
                            </tr>
                        
                            <tr>
                                <td valign="top" >
                                  <label for="password"><g:message code="user.password.label" default="Password" /></label>
                                </td>
                                <td valign="top">
                                    <g:passwordField name="password" value="${userInstance?.password}"  id="password" />
                                </td>
                            </tr>
                            <tr>
                                <td valign="top" >
                                  <label for="description"><g:message code="user.description.label" default="Description" /></label>
                                </td>
                                <td valign="top">
                                    <g:textArea name="description" value="${userInstance?.description}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div><center>
                    <span ><g:actionSubmit class="btn" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span ><g:actionSubmit class="btn" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
		</center>                
		</div>
            </g:form>
        </div>
    </body>
</html>
