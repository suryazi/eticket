
<%@ page import="com.maritimeco.Ticket" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'ticket.label', default: 'Ticket')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="ticket.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: ticketInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="ticket.pax.label" default="Pax" /></td>
                            
                            <td valign="top" class="value"><g:link controller="pax" action="show" id="${ticketInstance?.pax?.id}">${ticketInstance?.pax?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="ticket.car.label" default="Car" /></td>
                            
                            <td valign="top" class="value"><g:link controller="car" action="show" id="${ticketInstance?.car?.id}">${ticketInstance?.car?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="ticket.trip.label" default="Trip" /></td>
                            
                            <td valign="top" class="value"><g:link controller="trip" action="show" id="${ticketInstance?.trip?.id}">${ticketInstance?.trip?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="ticket.tClass.label" default="TC lass" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: ticketInstance, field: "tClass")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="ticket.board.label" default="Board" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: ticketInstance, field: "board")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="ticket.rem.label" default="Rem" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: ticketInstance, field: "rem")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="ticket.user.label" default="User" /></td>
                            
                            <td valign="top" class="value"><g:link controller="user" action="show" id="${ticketInstance?.user?.id}">${ticketInstance?.user?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="ticket.dateCreated.label" default="Date Created" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${ticketInstance?.dateCreated}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="ticket.lastupdated.label" default="Lastupdated" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${ticketInstance?.lastupdated}" /></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
              <g:if test="${session.user?.level=='Admin'}">
                <g:form>
                    <g:hiddenField name="id" value="${ticketInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
              </g:if>
            </div>
            <g:jasperReport jasper="eticket" format="PDF" name="eticket" >
                    <input type="hidden" name="ticket_id" value="${ticketInstance?.id}" />
            </g:jasperReport>
        </div>
    </body>
</html>
