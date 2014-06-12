

<%@ page import="com.maritimeco.Trip" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'trip.label', default: 'Trip')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <gui:resources components="['datePicker','autoComplete']"/>
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
            <g:hasErrors bean="${tripInstance}">
            <div class="errors">
                <g:renderErrors bean="${tripInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
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
                            
                            <tr/>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="tFr"><g:message code="trip.tFr.label" default="TFr" /></label>
                                </td>
                                <!--<td valign="top" class="value ${hasErrors(bean: tripInstance, field: 'tFr', 'errors')}">
                                    <g:select name="tFr" from="${['جازان','فرسان']}" value="${tripInstance?.tFr}"/>
                                </td>-->
                                <td valign="top" class="value ${hasErrors(bean: tripInstance, field: 'tFr', 'errors')}">
                                    <!--<g:select name="trip.id" from="${com.maritimeco.Trip.list()}" optionKey="id" value="${ticketInstance?.trip?.id}"  />-->
                                    
                                    <gui:autoComplete
                                      id="tFr"
                                      options="${['جازان','فرسان']}"
                                    />
                                    
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="bottom" class="name">
                                    <label for="tDate"><g:message code="trip.tDate.label" default="TD ate" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: tripInstance, field: 'tDate', 'errors')}">
                                    <!--<gui:datePicker id="tDate" name="tDate" value="${new Date()}" formatString="dd/MM/yyyy HH:mm" includeTime="true" />-->
                                    <g:datePicker name="tDate" precision="minute" value="${tripInstance?.tDate}"  />
                                </td>
                            </tr>
                        
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
