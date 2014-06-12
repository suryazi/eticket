

<%@ page import="com.maritimeco.Ferry" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'ferry.label', default: 'Ferry')}" />
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
            <g:hasErrors bean="${ferryInstance}">
            <div class="errors">
                <g:renderErrors bean="${ferryInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${ferryInstance?.id}" />
                <g:hiddenField name="version" value="${ferryInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="fName"><g:message code="ferry.fName.label" default="FN ame" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ferryInstance, field: 'fName', 'errors')}">
                                    <g:textField name="fName" value="${ferryInstance?.fName}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="pax"><g:message code="ferry.pax.label" default="Pax" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ferryInstance, field: 'pax', 'errors')}">
                                    <g:textField name="pax" value="${fieldValue(bean: ferryInstance, field: 'pax')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="cars"><g:message code="ferry.cars.label" default="Cars" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ferryInstance, field: 'cars', 'errors')}">
                                    <g:textField name="cars" value="${fieldValue(bean: ferryInstance, field: 'cars')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="dyna"><g:message code="ferry.dyna.label" default="Dyna" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ferryInstance, field: 'dyna', 'errors')}">
                                    <g:textField name="dyna" value="${fieldValue(bean: ferryInstance, field: 'dyna')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="wPax"><g:message code="ferry.wPax.label" default="WP ax" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ferryInstance, field: 'wPax', 'errors')}">
                                    <g:textField name="wPax" value="${fieldValue(bean: ferryInstance, field: 'wPax')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="wCars"><g:message code="ferry.wCars.label" default="WC ars" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ferryInstance, field: 'wCars', 'errors')}">
                                    <g:textField name="wCars" value="${fieldValue(bean: ferryInstance, field: 'wCars')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="wDyna"><g:message code="ferry.wDyna.label" default="WD yna" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ferryInstance, field: 'wDyna', 'errors')}">
                                    <g:textField name="wDyna" value="${fieldValue(bean: ferryInstance, field: 'wDyna')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="rPax"><g:message code="ferry.rPax.label" default="RP ax" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ferryInstance, field: 'rPax', 'errors')}">
                                    <g:textField name="rPax" value="${fieldValue(bean: ferryInstance, field: 'rPax')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="rCars"><g:message code="ferry.rCars.label" default="RC ars" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ferryInstance, field: 'rCars', 'errors')}">
                                    <g:textField name="rCars" value="${fieldValue(bean: ferryInstance, field: 'rCars')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="rDyna"><g:message code="ferry.rDyna.label" default="RD yna" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ferryInstance, field: 'rDyna', 'errors')}">
                                    <g:textField name="rDyna" value="${fieldValue(bean: ferryInstance, field: 'rDyna')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="vip"><g:message code="ferry.vip.label" default="Vip" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ferryInstance, field: 'vip', 'errors')}">
                                    <g:textField name="vip" value="${fieldValue(bean: ferryInstance, field: 'vip')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="tickets"><g:message code="ferry.tickets.label" default="Tickets" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ferryInstance, field: 'tickets', 'errors')}">
                                    <g:select name="tickets" from="${com.maritimeco.Ticket.list()}" multiple="yes" optionKey="id" size="5" value="${ferryInstance?.tickets*.id}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="trips"><g:message code="ferry.trips.label" default="Trips" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ferryInstance, field: 'trips', 'errors')}">
                                    
<ul>
<g:each in="${ferryInstance?.trips?}" var="t">
    <li><g:link controller="trip" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="trip" action="create" params="['ferry.id': ferryInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'trip.label', default: 'Trip')])}</g:link>

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
