

<%@ page import="com.maritimeco.Pax" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'pax.label', default: 'Pax')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link action="search">Search</g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${paxInstance}">
            <div class="errors">
                <g:renderErrors bean="${paxInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="pId"><g:message code="pax.pId.label" default="PI d" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: paxInstance, field: 'pId', 'errors')}">
                                    <g:textField name="pId" value="${fieldValue(bean: paxInstance, field: 'pId')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="pName"><g:message code="pax.pName.label" default="PN ame" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: paxInstance, field: 'pName', 'errors')}">
                                    <g:textField name="pName" value="${paxInstance?.pName}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="sex"><g:message code="pax.sex.label" default="Sex" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: paxInstance, field: 'sex', 'errors')}">
                                    <g:select name="sex" from="${['ذكر', 'أنثى']}" value="${paxInstance?.sex}/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nat"><g:message code="pax.nat.label" default="Nat" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: paxInstance, field: 'nat', 'errors')}">
                                    <g:textField name="nat" value="${paxInstance?.nat}" />
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
