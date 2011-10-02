

<%@ page import="org.sb.fc.User"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<g:set var="entityName"
	value="${message(code: 'user.label', default: 'User')}" />
<title><g:message code="default.create.label"
		args="[entityName]" /></title>
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
						<li><g:link action="list">
								<g:message code="default.list.label"  default="Users List" />
							</g:link>
						</li>
						<li><g:link controller="favori" action="listall">
								<g:message code="default.list.label"  default="Favoris List" />
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
		<h1>
			<g:message code="default.create.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message">
				${flash.message}
			</div>
		</g:if>
		<g:hasErrors bean="${userInstance}">
			<div class="errors">
				<g:renderErrors bean="${userInstance}" as="list" />
			</div>
		</g:hasErrors>
		<g:form action="save">
			<div>
				<table class="zebra-striped">
					<tbody>

						<tr>
							<td valign="top"><label for="accountExpired"><g:message
										code="user.accountExpired.label" default="Account Expired" />
							</label>
							</td>
							<td valign="top"><g:checkBox name="accountExpired"
									value="${userInstance?.accountExpired}" />
							</td>
						</tr>

						<tr>
							<td valign="top"><label for="accountLocked"><g:message
										code="user.accountLocked.label" default="Account Locked" /> </label>
							</td>
							<td valign="top"><g:checkBox name="accountLocked"
									value="${userInstance?.accountLocked}" />
							</td>
						</tr>

						<tr>
							<td valign="top"><label for="authority"><g:message
										code="user.authority.label" default="Authority" /> </label>
							</td>
							<td valign="top"><g:select name="authority"
									from="${org.sb.fc.Authority?.values()}"
									keys="${org.sb.fc.Authority?.values()*.name()}"
									value="${userInstance?.authority?.name()}" />
							</td>
						</tr>

						<tr>
							<td valign="top"><label for="email"><g:message
										code="user.email.label" default="Email" /> </label>
							</td>
							<td valign="top"><g:textField name="email"
									value="${userInstance?.email}" />
							</td>
						</tr>

						<tr>
							<td valign="top"><label for="enabled"><g:message
										code="user.enabled.label" default="Enabled" /> </label>
							</td>
							<td valign="top"><g:checkBox name="enabled"
									value="${userInstance?.enabled}" />
							</td>
						</tr>

						<tr>
							<td valign="top"><label for="password"><g:message
										code="user.password.label" default="Password" /> </label>
							</td>
							<td valign="top"><g:textField name="password"
									value="${userInstance?.password}" />
							</td>
						</tr>

						<tr>
							<td valign="top"><label for="passwordExpired"><g:message
										code="user.passwordExpired.label" default="Password Expired" />
							</label>
							</td>
							<td valign="top"><g:checkBox name="passwordExpired"
									value="${userInstance?.passwordExpired}" />
							</td>
						</tr>

						<tr>
							<td valign="top"><label for="status"><g:message
										code="user.status.label" default="Status" /> </label>
							</td>
							<td valign="top"><g:select name="status"
									from="${org.sb.fc.Status?.values()}"
									keys="${org.sb.fc.Status?.values()*.name()}"
									value="${userInstance?.status?.name()}" />
							</td>
						</tr>

						<tr>
							<td valign="top"><label for="username"><g:message
										code="user.username.label" default="Username" /> </label>
							</td>
							<td valign="top"><g:textField name="username"
									value="${userInstance?.username}" />
							</td>
						</tr>

					</tbody>
				</table>
			</div>
			<div>
				<center>
					<g:submitButton class="btn large" name="create"
						value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</center>
			</div>
		</g:form>
	</div>
</body>
</html>
