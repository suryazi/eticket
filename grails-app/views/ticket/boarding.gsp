

<%@ page import="com.maritimeco.Ticket" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'ticket.label', default: 'Ticket')}" />
        <title>Create Boarding</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1>Create Boarding</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${ticketInstance}">
            <div class="errors">
                <g:renderErrors bean="${ticketInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="board" >
                <div class="dialog">
                    <table>
                        <tbody>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="id"><g:message code="ticket.id.label" default="Ticket#" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ticketInstance, field: 'id', 'errors')}">
                                    <g:textField name="id" value="${ticketInstance?.id}" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="board" value="${message(code: 'default.button.board.label', default: 'Board')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
