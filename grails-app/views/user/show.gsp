
<%@ page import="org.sb.fc.User" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
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
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div >
                <table>
                    <tbody>
                    
                        <tr >
                            <td valign="top" ><g:message code="user.id.label" default="Id" /></td>
                            
                            <td valign="top" >${fieldValue(bean: userInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr >
                            <td valign="top" ><g:message code="user.accountExpired.label" default="Account Expired" /></td>
                            
                            <td valign="top" ><g:formatBoolean boolean="${userInstance?.accountExpired}" /></td>
                            
                        </tr>
                    
                        <tr >
                            <td valign="top" ><g:message code="user.accountLocked.label" default="Account Locked" /></td>
                            
                            <td valign="top" ><g:formatBoolean boolean="${userInstance?.accountLocked}" /></td>
                            
                        </tr>
                    
                        <tr >
                            <td valign="top" ><g:message code="user.authority.label" default="Authority" /></td>
                            
                            <td valign="top" >${userInstance?.authority?.encodeAsHTML()}</td>
                            
                        </tr>
                    
                        <tr >
                            <td valign="top" ><g:message code="user.email.label" default="Email" /></td>
                            
                            <td valign="top" >${fieldValue(bean: userInstance, field: "email")}</td>
                            
                        </tr>
                    
                        <tr >
                            <td valign="top" ><g:message code="user.enabled.label" default="Enabled" /></td>
                            
                            <td valign="top" ><g:formatBoolean boolean="${userInstance?.enabled}" /></td>
                            
                        </tr>
                    
                        <tr >
                            <td valign="top" ><g:message code="user.favoris.label" default="Favoris" /></td>
                            
                            <td valign="top" style="text-align: left;" >
                                <ul>
                                <g:each in="${userInstance.favoris}" var="f">
                                    <li><g:link controller="favori" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr >
                            <td valign="top" ><g:message code="user.password.label" default="Password" /></td>
                            
                            <td valign="top" >${fieldValue(bean: userInstance, field: "password")}</td>
                            
                        </tr>
                    
                        <tr >
                            <td valign="top" ><g:message code="user.passwordExpired.label" default="Password Expired" /></td>
                            
                            <td valign="top" ><g:formatBoolean boolean="${userInstance?.passwordExpired}" /></td>
                            
                        </tr>
                    
                        <tr >
                            <td valign="top" ><g:message code="user.status.label" default="Status" /></td>
                            
                            <td valign="top" >${userInstance?.status?.encodeAsHTML()}</td>
                            
                        </tr>
                    
                        <tr >
                            <td valign="top" ><g:message code="user.username.label" default="Username" /></td>
                            
                            <td valign="top" >${fieldValue(bean: userInstance, field: "username")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div ><center>
                <g:form>
                    <g:hiddenField name="id" value="${userInstance?.id}" />
                    <span ><g:actionSubmit class="btn" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    
                </g:form>
</center>
            </div>
        </div>
    </body>
</html>
