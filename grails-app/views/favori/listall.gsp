
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
						<li><g:link controller="admin"  action="list">
								<g:message code="default.list.user.label"  default="Users List" />
							</g:link>
						</li>
						<li><g:link controller="admin" action="create">
								<g:message code="default.new.user.label" default="Create User" />
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
            <h2><g:message code="default.list.favori.label" /></h2>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div>
                <table class="zebra-striped">
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'favori.id.label', default: 'Id')}" />
                        
                            <th><g:message code="favori.owner.label" default="Owner" /></th>
                        
                            <g:sortableColumn property="title" title="${message(code: 'favori.title.label', default: 'Title')}" />
                        
                            <g:sortableColumn property="url" title="${message(code: 'favori.url.label', default: 'Url')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${favoriInstanceList}" status="i" var="favoriInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${favoriInstance.id}">${fieldValue(bean: favoriInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: favoriInstance, field: "owner.username")}</td>
                        
                            <td>${fieldValue(bean: favoriInstance, field: "title")}</td>
                        
                            <td>${fieldValue(bean: favoriInstance, field: "url")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate  total="${favoriInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
