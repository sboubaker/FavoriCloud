
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
					<ul class="nav">
						<li><a class="active" href="${createLink(uri: '/')}"><g:message
									code="default.home.label" /> </a>
						</li>
						
							<li><g:link controller="favori" action="listall">
								<g:message code="default.list.favori.label" default="Favoris List"/>
							</g:link></li>
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
		<h2>
			<g:message code="default.list.user.label" />
		</h2>
		<g:if test="${flash.message}">
			<div class="message">
				${flash.message}
			</div>
		</g:if>
		<div>
			<table class="zebra-striped">
				<thead>
					<tr>

						<th><a href="/Fcloud/admin/list?sort=id&amp;order=asc"> ${message(code: 'user.id.label', default: 'Id')}
						</a>
						</th>

						<th><a
							href="/Fcloud/admin/list?sort=accountExpired&amp;order=asc">
								${message(code: 'user.accountExpired.label', default: 'Account Expired')}
						</a>
						</th>

						<th><a
							href="/Fcloud/admin/list?sort=accountLocked&amp;order=asc"> ${message(code: 'user.accountLocked.label', default: 'Account Locked')}
						</a>
						</th>

						<th><a href="/Fcloud/admin/list?sort=authority&amp;order=asc">
								${message(code: 'user.authority.label', default: 'Authority')} </a>
						</th>

						<th><a href="/Fcloud/admin/list?sort=email&amp;order=desc">
								${message(code: 'user.email.label', default: 'Email')} </a>
						</th>

						<th><a href="/Fcloud/admin/list?sort=enabled&amp;order=asc">
								${message(code: 'user.enabled.label', default: 'Enabled')} </a>
						</th>

					</tr>
				</thead>
				<tbody>
					<g:each in="${userInstanceList}" status="i" var="userInstance">
						<tr>

							<td><g:link action="show" id="${userInstance.id}">
									${fieldValue(bean: userInstance, field: "id")}
								</g:link>
							</td>

							<td><g:formatBoolean
									boolean="${userInstance.accountExpired}" />
							</td>

							<td><g:formatBoolean boolean="${userInstance.accountLocked}" />
							</td>

							<td>
								${fieldValue(bean: userInstance, field: "authority")}
							</td>

							<td>
								${fieldValue(bean: userInstance, field: "email")}
							</td>

							<td><g:formatBoolean boolean="${userInstance.enabled}" />
							</td>

						</tr>
					</g:each>
				</tbody>
			</table>
		</div>
		<div class="paginateButtons">
			<g:paginate total="${userInstanceTotal}" />
		</div>
	</div>
</body>
</html>
