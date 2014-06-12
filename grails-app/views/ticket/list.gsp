
<%@ page import="com.maritimeco.Ticket" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'ticket.label', default: 'Ticket')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'ticket.id.label', default: 'Id')}" />
                        
                            <th><g:message code="ticket.pax.label" default="Pax" /></th>
                        
                            <th><g:message code="ticket.car.label" default="Car" /></th>
                        
                            <th><g:message code="ticket.trip.label" default="Trip" /></th>
                        
                            <g:sortableColumn property="tClass" title="${message(code: 'ticket.tClass.label', default: 'TC lass')}" />
                        
                            <g:sortableColumn property="board" title="${message(code: 'ticket.board.label', default: 'Board')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${ticketInstanceList}" status="i" var="ticketInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${ticketInstance.id}">${fieldValue(bean: ticketInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: ticketInstance, field: "pax")}</td>
                        
                            <td>${fieldValue(bean: ticketInstance, field: "car")}</td>
                        
                            <td>${fieldValue(bean: ticketInstance, field: "trip")}</td>
                        
                            <td>${fieldValue(bean: ticketInstance, field: "tClass")}</td>
                        
                            <td>${fieldValue(bean: ticketInstance, field: "board")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${ticketInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
