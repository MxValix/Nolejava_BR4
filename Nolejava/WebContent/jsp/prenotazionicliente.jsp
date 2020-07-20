<%@page import="com.comunenapoli.progetto.model.Noleggio"%>
<%@page import="java.util.List"%>
<%@page import="com.comunenapoli.progetto.model.Utente"%>
<%@page import="com.comunenapoli.progetto.utils.Costanti"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1> Verifica utenti</h1>

<% 
	Utente utente = (Utente) request.getSession().getAttribute(Costanti.USER_IN_SESSION);
	List<Noleggio> listaPrenotazioni = (List<Noleggio>) utente.getNoleggi();
	
%>
		<table>
			<tr>
				<th>id Noleggio</th>
				<th>Data prenotazione</th>		
				<th>Data inizio noleggio</th>
				<th>Data fine noleggio</th>	
				<th>Marca auto</th>	
				<th>Modello auto</th>	
				<th>Annulla prenotazione</th>	
				
					
			</tr>
			

</body>
</html>