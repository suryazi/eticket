
<%@ page import="com.maritimeco.Pax" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'pax.label', default: 'Pax')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link action="search">Search</g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'pax.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="pId" title="${message(code: 'pax.pId.label', default: 'PI d')}" />
                        
                            <g:sortableColumn property="pName" title="${message(code: 'pax.pName.label', default: 'PN ame')}" />
                        
                            <g:sortableColumn property="sex" title="${message(code: 'pax.sex.label', default: 'Sex')}" />
                        
                            <g:sortableColumn property="nat" title="${message(code: 'pax.nat.label', default: 'Nat')}" />
                        
                            <g:sortableColumn property="dateCreated" title="${message(code: 'pax.dateCreated.label', default: 'Date Created')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${paxInstanceList}" status="i" var="paxInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${paxInstance.id}">${fieldValue(bean: paxInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: paxInstance, field: "pId")}</td>
                        
                            <td>${fieldValue(bean: paxInstance, field: "pName")}</td>
                        
                            <td>${fieldValue(bean: paxInstance, field: "sex")}</td>
                        
                            <td>${fieldValue(bean: paxInstance, field: "nat")}</td>
                        
                            <td><g:formatDate date="${paxInstance.dateCreated}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${paxInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
