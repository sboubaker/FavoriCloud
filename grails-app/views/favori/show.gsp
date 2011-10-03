
<%@ page import="org.sb.fc.Favori"%>
<%@ page import="org.sb.fc.Authority"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<g:set var="entityName"
	value="${message(code: 'favori.label', default: 'Favori')}" />
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
									code="default.home.label" /> </a></li>
						<li><g:link action="create">
								<g:message code="default.new.label" args="[entityName]" />
							</g:link></li>
						<li><g:link controller="user" action="show">
								<g:message code="default.profil.label" default="Profil" />
							</g:link></li>
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
			<g:message code="default.show.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="alert-message success">
				${flash.message}
			</div>
		</g:if>
		<div class="zebra-striped">
			<table>
				<tbody>
					<g:if test="${session.authority ==  Authority.ROOT}">
						<tr>
							<td valign="top"><g:message code="favori.owner.label"
									default="Owner" />
							</td>

							<td valign="top"><g:link controller="admin" action="show"
									id="${favoriInstance?.owner?.id}">
									${favoriInstance?.owner?.email}
								</g:link>
							</td>

						</tr>
					</g:if>
					<tr>
						<td valign="top"><g:message code="favori.title.label"
								default="Title" />
						</td>

						<td valign="top">
							${fieldValue(bean: favoriInstance, field: "title")}
						</td>

					</tr>

					<tr>
						<td valign="top"><g:message code="favori.url.label"
								default="Url" />
						</td>

						<td valign="top">
							${fieldValue(bean: favoriInstance, field: "url")}
						</td>

					</tr>

				</tbody>
			</table>
		</div>
		<g:if test="${session.authority ==  Authority.USER}">
			<div>

				<center>
					<span> <span><g:link class="btn" action="edit"
								id="${favoriInstance.id}"
								value="${message(code: 'default.edit.label', default: 'Edit')}">
								<g:message code="default.edit.label" default="Edit" />
							</g:link> </span> <g:link class="btn" action="delete" id="${favoriInstance.id}"
							onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
							<g:message code="default.delete.label" default="Delete" />
						</g:link> </span>
				</center>

			</div>
		</g:if>
	</div>
</body>
</html>
