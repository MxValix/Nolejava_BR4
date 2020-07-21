<%@page import="com.comunenapoli.progetto.model.CalendarioChiusure"%>
<%@page import="java.sql.Date"%>
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
<title>Calendario chiusure</title>
</head>
<body>
<h1> Calendario chiusurei</h1>


<form action="/Nolejava/calendarioChiusureServlet" method="POST">
  <fieldset>
    <legend>Inserisci chiusura programmata</legend>
	<input type="date" placeholder="Data inizio chiusura" name="datainizio" value="" required>
		<br>
		<input type="date" placeholder="Data fine chisura" name="datafine" value="" required>
		<br>      
    <input type="submit" name="action" value="Conferma">
  </fieldset>
</form>


<% 
	Utente utente = (Utente) request.getSession().getAttribute(Costanti.USER_IN_SESSION);
	List<CalendarioChiusure> listaChiusure = (List<CalendarioChiusure>) request.getSession().getAttribute(Costanti.LISTA_COMPLETA_CHIUSURE);
	if (listaChiusure!=null && !listaChiusure.isEmpty()) {
%>
		<table>
			<tr>	
				<th>Data inizio chiusura</th>
				<th>Data fine chisuura</th>	
				
			</tr>
<% 
	for (int i=0; i<listaChiusure.size();i++){
		CalendarioChiusure chiusuraCorrente = listaChiusure.get(i);
		Date dataInizio = chiusuraCorrente.getDataInizio();
		Date dataFine = chiusuraCorrente.getDataFine();

%>
	<tr>
				<td><%=dataInizio%></td>
				<td><%=dataFine%></td>
									
			</tr>		
<%
		}
%>
		</table>
<%
	}
%>		
	
</body>
</html>