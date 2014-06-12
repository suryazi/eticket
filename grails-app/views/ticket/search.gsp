<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta name="layout" content="main">
    <title>Search Ticket</title>
  </head>
  <body>
  <formset>
    <legend>Search for Ticket</legend>
    <g:form action="results">
      <label for="ticketId">Ticket Id</label>
      <g:textField name="ticketId"/>
      <g:submitButton name="search" value="Search"/>
    </g:form>
  </formset>
  </body>
</html>
