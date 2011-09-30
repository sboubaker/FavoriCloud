
<%@ page import="org.sb.fc.Favori" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'favori.label', default: 'Favori')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        	<span class="menuButton"><g:link class="list" controller="user" action="logout">Logout</g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div>
                <table>
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
                        
                            <td>${fieldValue(bean: favoriInstance, field: "owner")}</td>
                        
                            <td>${fieldValue(bean: favoriInstance, field: "title")}</td>
                        
                            <td>${fieldValue(bean: favoriInstance, field: "url")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${favoriInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
