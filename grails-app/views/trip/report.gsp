

<%@ page import="com.maritimeco.Trip" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'trip.label', default: 'Trip')}" />
        <title>Trip Details</title>
        <gui:resources components="['autoComplete']"/>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1>Trip Details</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${tripInstance}">
            <div class="errors">
                <g:renderErrors bean="${tripInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="print" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="ferry"><g:message code="trip.ferry.label" default="Ferry" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: tripInstance, field: 'ferry', 'errors')}">
                                    <gui:autoComplete
                                      id="ferry"
                                      resultName="ferry"
                                      labelField="fName"
                                      idField="id"
                                      controller="ferry"
                                      action="ferryAutoComplete"
                                      />
                                </td>
                                <!--<td valign="top" class="value ${hasErrors(bean: tripInstance, field: 'ferry', 'errors')}">
                                    <g:select name="ferry.id" from="${com.maritimeco.Ferry.list()}" optionKey="id" value="${tripInstance?.ferry?.id}"  />
                                </td>-->
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="trip"><g:message code="ticket.trip.label" default="Trip" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: tripInstance, field: 'tFr', 'errors')}">
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
                                      action="tripRepAutoComplete"
                                      dependsOn="fr"
                                      queryDelay='0.5'
                                    />
                                </td>
                            </tr>
                        
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="print" class="print" value="Print" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
