

<%@ page import="org.sb.fc.User"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<g:set var="entityName"
	value="${message(code: 'user.label', default: 'User')}" />
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
				</div>
			</div>
			<!-- /topbar-inner -->
		</div>
		<!-- /topbar -->
	</div>
	<div class="container">
		<h1>
			<g:message code="default.inscription.label" default="Inscription" />
		</h1>
		<g:if test="${flash.message}">
			<div class="alert-message succes">
				${flash.message}
			</div>
		</g:if>
		<div>

			<g:hasErrors bean="${userInstance}">
				<g:eachError>
					<p class="alert-message error">
						<g:message error="${it}" />
					</p>
				</g:eachError>
			</g:hasErrors>
		</div>
		<g:form action="save" id="createForm">
			<div>
				<table class="zebra-striped">
					<tbody>

						<tr>
							<td valign="top"><label for="username"><g:message
										code="user.username.label" default="Username" /> </label></td>
							<td valign="top"><g:textField name="username"
									value="${userInstance?.username}" /></td>
						</tr>

						<tr>
							<td valign="top"><label for="email"><g:message
										code="user.email.label" default="Email" /> </label></td>
							<td valign="top"><g:textField name="email"
									value="${userInstance?.email}" /></td>
						</tr>



						<tr>
							<td valign="top"><label for="password"><g:message
										code="user.password.label" default="Password" /> </label></td>
							<td valign="top"><g:passwordField name="password"
									id="password" value="${userInstance?.password}" /></td>
						</tr>

					</tbody>
				</table>
			</div>
			<div>
				<center>
					<span><g:submitButton name="create" class="btn"
							value="${message(code: 'default.button.create.label', default: 'Create')}" />
					</span>
				</center>
			</div>
		</g:form>
	</div>
</body>
</html>
