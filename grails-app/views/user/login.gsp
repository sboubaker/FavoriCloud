

<%@ page import="org.sb.fc.User"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<link rel="stylesheet"
	href="http://twitter.github.com/bootstrap/1.3.0/bootstrap.min.css">
<g:set var="entityName"
	value="${message(code: 'user.label', default: 'User')}" />
<title><g:message code="default.create.label"
		args="[entityName]" /></title>
</head>
<body>
	<div class="container">
		<center>
			<h2>
				<g:message code="default.login.label" />
			</h2>
		</center>
		<g:if test="${flash.message}">
			<div class="message">
				${flash.message}
			</div>
		</g:if>
		<g:form controller="user" action="authenticate">
			<div>
				<table>
					<tbody>
						<tr>
							<td valign="top"><label for="email"><b><g:message
											code="user.email.label" default="Email" />
								</b>
							</label>
							</td>
							<td valign="top"><g:textField name="email" />
							</td>
						</tr>


						<tr>
							<td valign="top"><label for="password"><b><g:message
											code="user.password.label" default="Password" />
								</b>
							</label>
							</td>
							<td valign="top"><g:textField name="password" /></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div>
				<center>
					<g:submitButton class="btn larg" name="create"
						value="${message(code: 'default.button.login.label', default: 'Login')}" />
				</center>
			</div>
		</g:form>
		<div>
			<center>
				<span class="label notice"><g:link controller="user"
						action="create">M'inscrire</g:link> </span>
			</center>
		</div>
	</div>
</body>
</html>
