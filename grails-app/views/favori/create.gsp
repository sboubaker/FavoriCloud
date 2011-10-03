

<%@ page import="org.sb.fc.Favori" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'favori.label', default: 'Favori')}" />
        <title>FCloud</title>
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
						
						<li><g:link controller="user" action="show">
								<g:message code="default.profil.label" default="Profil" />
							</g:link>
						</li>
						<li><g:link controller="user" action="logout"><g:message code="default.deconnection" default="Logout" /></g:link>
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
            <h2><g:message code="new.favori.label" default="New Favori" /></h2>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${favoriInstance}">
            <div class="errors">
                <g:renderErrors bean="${favoriInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save">
                <div>
                    <table>
                        <tbody>
                        <tr >
                                <td valign="top" >
                                    <label for="title"><g:message code="favori.title.label" default="Title" /></label>
                                </td>
                                <td valign="top">
                                    <g:textField name="title" value="${favoriInstance?.title}" />
                                </td>
                            </tr>
                        
                            <tr >
                                <td valign="top" >
                                    <label for="url"><g:message code="favori.url.label" default="Url" /></label>
                                </td>
                                <td valign="top">
                                    <g:textField name="url" value="${favoriInstance?.url}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div><center>
                    <span><g:submitButton name="create" class="btn" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                	</center>
                </div>
            </g:form>
        </div>
    </body>
</html>
