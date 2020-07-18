<%@page import="com.comunenapoli.progetto.utils.Costanti"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Carta - Nolejava</title>
</head>
<body>
<% 	
	String numeroCarta = (String) request.getAttribute(Costanti.NUMERO_CARTA);
	String cvv = (String) request.getAttribute(Costanti.NUMERO_CARTA);
	
 %>

	<form action="/Nolejava/cartaServlet" method="POST">
		<label>Data scadenza:</label><br> <input type="date" name="datascadenza"></input><br> 
		<label>Numero carta:</label><br>
		<input type="text" name="numerocarta" value="<%=numeroCarta%>"
		<% if (numeroCarta!="" || !numeroCarta.isEmpty()) { %>readonly <% } %> /><br> 
		<label>Cvv:</label><br>
		<input type="text" name="cvv" value="<%=cvv%>"
		<% if (cvv!="" || !cvv.isEmpty()) { %>readonly <% } %>
		/><br> 
		<br> <input type="submit" value="Crea carta"/><br>
	</form>
</body>
</html>