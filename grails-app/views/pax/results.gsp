<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Pax Search Results</title>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'pax.label', default: 'Pax')}" />
  </head>
  <body>
    <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
    </div>
        <div class="body">
          <h1>Results</h1>
          <p>Searched ${com.maritimeco.Pax.count()} records
            for items matching <em><strong>${term}</strong></em>.
            Found <strong>${pax.size()}</strong> hits.
          </p>
          <ul>
            <g:each var="pax" in="${pax}">
              <li><strong>${pax.pId}</strong></li></g:each>
        </div>
  </body>
</html>
