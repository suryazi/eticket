

<%@ page import="com.maritimeco.Ticket" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'ticket.label', default: 'Ticket')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <gui:resources components="['autoComplete']"/>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${ticketInstance}">
            <div class="errors">
                <g:renderErrors bean="${ticketInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="pax"><g:message code="ticket.pax.label" default="Pax" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ticketInstance, field: 'pax', 'errors')}">
                                  <g:textField name="pId"/>
                                    
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="trip"><g:message code="ticket.trip.label" default="Trip" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ticketInstance, field: 'trip', 'errors')}">
                                    <!--<g:select name="trip.id" from="${com.maritimeco.Trip.list()}" optionKey="id" value="${ticketInstance?.trip?.id}"  />-->
                                    From:
                                    <gui:autoComplete
                                      id="fr"
                                      options="${['جازان','فرسان']}"
                                    />
                                    Date:
                                    <gui:autoComplete
                                      id="trips"
                                      resultName="trips"
                                      labelField="tDate"
                                      idField="id"
                                      controller="trip"
                                      action="tripAutoComplete"
                                      dependsOn="fr"
                                      queryDelay='0.5'
                                    />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="tClass"><g:message code="ticket.tClass.label" default="TC lass" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ticketInstance, field: 'tClass', 'errors')}">
                                    <g:if test="${session.user?.level=='Admin'}">
                                      <g:select name="tClass" from="${['ثانية','ممتازة']}" value="${ticketInstance?.tClass}" />
                                    </g:if>
                                    <g:else>
                                      <g:select name="tClass" from="${['ثانية']}" value="${ticketInstance?.tClass}" />
                                    </g:else>
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="car"><g:message code="ticket.car.label" default="Car" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ticketInstance, field: 'car', 'errors')}">
                                  <g:textField name="pltNo"/>
                                    
                                </td>
                            </tr>
                        
                            <!--<tr class="prop">
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
                            </tr>-->
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
