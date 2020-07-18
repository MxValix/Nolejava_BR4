<%@page import="com.comunenapoli.progetto.utils.Costanti"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Patente - Nolejava</title>
</head>
<body>
<% 	
	String numeroPatente = (String)request.getAttribute(Costanti.NUMERO_PATENTE);
	
 %>

	<form action="/Nolejava/patenteServlet" method="POST">
		<label>Data scadenza:</label><br> <input type="date" name="datascadenza"
			value=""></input><br> 
		<label>Numero patente:</label><br>
		<input type="text" name="numeropatente" value="<%=numeroPatente%>"
		<% if (numeroPatente!="" || !numeroPatente.isEmpty()) { %>readonly <% } %> /><br> 
		<br> <input type="submit" value="Crea patente"/><br>
	</form>
</body>
</html>