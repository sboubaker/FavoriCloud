

<%@ page import="org.sb.fc.User"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<g:set var="entityName"
	value="${message(code: 'user.label', default: 'User')}" />
<title>FCloud</title>
<script>
  $(document).ready(function(){
    $("#loginForm").validate();
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
				</div>
			</div>
			<!-- /topbar-inner -->
		</div>
		<!-- /topbar -->
	</div>
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
		<g:form controller="user" action="authenticate" id="loginForm">
			<div>
				<table>
					<tbody>
						<tr>
							<td valign="top"><label for="email"><b><g:message
											code="user.email.label" default="Email"  /> </b> </label>
							</td>
							<td valign="top"><g:textField name="email" class="required" />
							</td>
						</tr>


						<tr>
							<td valign="top"><label for="password"><b><g:message
											code="user.password.label" default="Password" /> </b> </label>
							</td>
							<td valign="top"><g:passwordField name="password" /></td>
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
