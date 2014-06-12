
<%@ page import="com.maritimeco.Ferry" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'ferry.label', default: 'Ferry')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'ferry.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="fName" title="${message(code: 'ferry.fName.label', default: 'FN ame')}" />
                        
                            <g:sortableColumn property="pax" title="${message(code: 'ferry.pax.label', default: 'Pax')}" />
                        
                            <g:sortableColumn property="cars" title="${message(code: 'ferry.cars.label', default: 'Cars')}" />
                        
                            <g:sortableColumn property="dyna" title="${message(code: 'ferry.dyna.label', default: 'Dyna')}" />
                        
                            <g:sortableColumn property="wPax" title="${message(code: 'ferry.wPax.label', default: 'WP ax')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${ferryInstanceList}" status="i" var="ferryInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${ferryInstance.id}">${fieldValue(bean: ferryInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: ferryInstance, field: "fName")}</td>
                        
                            <td>${fieldValue(bean: ferryInstance, field: "pax")}</td>
                        
                            <td>${fieldValue(bean: ferryInstance, field: "cars")}</td>
                        
                            <td>${fieldValue(bean: ferryInstance, field: "dyna")}</td>
                        
                            <td>${fieldValue(bean: ferryInstance, field: "wPax")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${ferryInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
