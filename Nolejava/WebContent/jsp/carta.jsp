<%@page import="com.comunenapoli.progetto.model.CartaDiCredito"%>
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
	CartaDiCredito carta = (CartaDiCredito) request.getAttribute(Costanti.CARTA_IN_SESSION);
	String numeroCarta = "";
	String cvv =  "";
	String idCarta = "";


	String operazioneCarta = "Crea carta";
	if (carta!=null){
		operazioneCarta = "Aggiorna carta";
		numeroCarta = carta.getNumeroCarta();
		idCarta = carta.getIdCartaDiCredito().toString();
		cvv = carta.getCvv().toString();
	}
	
	
 %>

	<form action="/Nolejava/cartaServlet" method="POST">
		<input type="hidden" name="idCarta" id="idCarta" value="<%=idCarta%>"><br> 
		<label for="datascadenza">Data scadenza:</label><br> 
		<input type="date" name="datascadenza" id="datascadenza" required/><br> 
		<label for="numerocarta">Numero carta:</label><br>
		<input id="numerocarta"  name="numerocarta" type="number" inputmode="numeric" pattern="[0-9\s]{13,19}" autocomplete="cc-number" 
		maxlength="19" value="<%=numeroCarta%>" required><br>
		<label for="cvv">Cvv:</label><br>
		<input type="number" id="cvv" name="cvv" value="<%=cvv%>" required/><br> 
		<br> <input type="submit" value="<%=operazioneCarta%>"/><br>
	</form>
</body>
</html>