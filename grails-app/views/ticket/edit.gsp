

<%@ page import="com.maritimeco.Ticket" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'ticket.label', default: 'Ticket')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${ticketInstance}">
            <div class="errors">
                <g:renderErrors bean="${ticketInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${ticketInstance?.id}" />
                <g:hiddenField name="version" value="${ticketInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="pax"><g:message code="ticket.pax.label" default="Pax" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ticketInstance, field: 'pax', 'errors')}">
                                    <g:select name="pax.id" from="${com.maritimeco.Pax.list()}" optionKey="id" value="${ticketInstance?.pax?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="car"><g:message code="ticket.car.label" default="Car" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ticketInstance, field: 'car', 'errors')}">
                                    <g:select name="car.id" from="${com.maritimeco.Car.list()}" optionKey="id" value="${ticketInstance?.car?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="trip"><g:message code="ticket.trip.label" default="Trip" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ticketInstance, field: 'trip', 'errors')}">
                                    <g:select name="trip.id" from="${com.maritimeco.Trip.list()}" optionKey="id" value="${ticketInstance?.trip?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="tClass"><g:message code="ticket.tClass.label" default="TC lass" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ticketInstance, field: 'tClass', 'errors')}">
                                    <g:textField name="tClass" value="${ticketInstance?.tClass}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="board"><g:message code="ticket.board.label" default="Board" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ticketInstance, field: 'board', 'errors')}">
                                    <g:textField name="board" value="${ticketInstance?.board}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="rem"><g:message code="ticket.rem.label" default="Rem" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ticketInstance, field: 'rem', 'errors')}">
                                    <g:textField name="rem" value="${ticketInstance?.rem}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="user"><g:message code="ticket.user.label" default="User" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ticketInstance, field: 'user', 'errors')}">
                                    <g:select name="user.id" from="${com.maritimeco.User.list()}" optionKey="id" value="${ticketInstance?.user?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="lastupdated"><g:message code="ticket.lastupdated.label" default="Lastupdated" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ticketInstance, field: 'lastupdated', 'errors')}">
                                    <g:datePicker name="lastupdated" precision="day" value="${ticketInstance?.lastupdated}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
