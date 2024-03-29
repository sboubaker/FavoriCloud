<%@ page import="org.sb.fc.Favori"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<g:set var="entityName"
	value="${message(code: 'favori.label', default: 'Favori')}" />
<title><g:message code="default.edit.label" args="[entityName]" />
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
		<h2>
			<g:message code="default.edit.label" />
		</h2>
		<g:if test="${flash.message}">
			<div class="alert-message succes">
				${flash.message}
			</div>
		</g:if>
		<g:hasErrors bean="${favoriInstance}">
			<g:eachError>
				<p class="alert-message error">
					<g:message error="${it}" />
				</p>
			</g:eachError>
		</g:hasErrors>
		<g:form method="post">
			<g:hiddenField name="id" value="${favoriInstance?.id}" />
			<g:hiddenField name="version" value="${favoriInstance?.version}" />
			<div class="dialog">
				<table>
					<tbody>

						<tr>
							<td valign="top"><label for="title"><b><g:message
											code="favori.title.label" default="Title" />
								</b> </label>
							</td>
							<td valign="top"><g:textField name="title"
									value="${favoriInstance?.title}" />
							</td>
						</tr>

						<tr>
							<td valign="top"><label for="url"><b><g:message
											code="favori.url.label" default="Url" />
								</b> </label>
							</td>
							<td valign="top"><g:textField name="url"
									value="${favoriInstance?.url}" />
							</td>
						</tr>

					</tbody>
				</table>
			</div>
			<div>
				<center>
					<span><g:actionSubmit class="btn" action="update"
							value="${message(code: 'default.ok.label', default: 'Ok')}" /> </span>
					<span><g:actionSubmit class="btn" action="delete"
							value="${message(code: 'default.delete.label', default: 'Delete')}"
							onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</span>
				</center>
			</div>
		</g:form>
	</div>
</body>
</html>
