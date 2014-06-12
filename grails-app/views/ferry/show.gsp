
<%@ page import="com.maritimeco.Ferry" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'ferry.label', default: 'Ferry')}" />
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
                            <td valign="top" class="name"><g:message code="ferry.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: ferryInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="ferry.fName.label" default="FN ame" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: ferryInstance, field: "fName")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="ferry.pax.label" default="Pax" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: ferryInstance, field: "pax")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="ferry.cars.label" default="Cars" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: ferryInstance, field: "cars")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="ferry.dyna.label" default="Dyna" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: ferryInstance, field: "dyna")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="ferry.wPax.label" default="WP ax" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: ferryInstance, field: "wPax")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="ferry.wCars.label" default="WC ars" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: ferryInstance, field: "wCars")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="ferry.wDyna.label" default="WD yna" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: ferryInstance, field: "wDyna")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="ferry.rPax.label" default="RP ax" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: ferryInstance, field: "rPax")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="ferry.rCars.label" default="RC ars" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: ferryInstance, field: "rCars")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="ferry.rDyna.label" default="RD yna" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: ferryInstance, field: "rDyna")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="ferry.vip.label" default="Vip" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: ferryInstance, field: "vip")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="ferry.dateCreated.label" default="Date Created" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${ferryInstance?.dateCreated}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="ferry.lastUpdated.label" default="Last Updated" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${ferryInstance?.lastUpdated}" /></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${ferryInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
