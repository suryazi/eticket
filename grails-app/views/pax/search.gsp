<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Search Passenger</title>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'pax.label', default: 'Pax')}" />
  </head>
  <body>
    <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
    </div>
        <div class="body">
          <h1>Search for Passenger</h1>

          <g:form action="results">
            <label for="pId">Passenger Id</label>
            <g:textField name="pId"></g:textField>

            <g:submitButton name="search" value="Search"/>
          </g:form>
        </div>
  </body>
</html>
