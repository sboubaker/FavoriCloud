
<%@ page import="org.sb.fc.Favori"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<g:set var="entityName"
	value="${message(code: 'favori.label', default: 'Favori')}" />
<title><g:message code="default.list.label" args="[entityName]" />
</title>
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
						<li><g:link controller="user" action="show">
								<g:message code="default.profil.label" default="Profil" />
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
			<g:message code="default.list.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message">
				${flash.message}
			</div>
		</g:if>
		<div>
			<table class="zebra-striped">
				<thead>
					<tr>

						<g:sortableColumn property="title"
							title="${message(code: 'favori.title.label', default: 'Title')}" />
						<g:sortableColumn property="url"
							title="${message(code: 'favori.url.label', default: 'Url')}" />
						<th width="10%"/>
						<th width="10%"/>
						

					</tr>
				</thead>
				<tbody>
					<g:each in="${favoriInstanceList}" status="i" var="favoriInstance">
						<tr>

							<td>${fieldValue(bean: favoriInstance, field: "title")}</td>

							<td>
								${fieldValue(bean: favoriInstance, field: "url")}
							</td>
							<td><g:link class="btn" action="edit" id="${favoriInstance.id}">
									edit
								</g:link></td>
							<td><g:link class="btn" action="delete" id="${favoriInstance.id}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
									delete
								</g:link>
							
							</td>
						</tr>
					</g:each>
				</tbody>
			</table>
		</div>
		<div>
			<g:paginate total="${favoriInstanceTotal}" />
		</div>
	</div>
</body>
</html>
