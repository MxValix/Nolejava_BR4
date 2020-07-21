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
<title>Gestisci noleggi</title>
</head>
<body>
<h1> Gestisci noleggi</h1>

<form action="/Nolejava/gestisciNoleggioServlet" method="POST">
  <fieldset>
    <legend>Ricerca prenotazioni</legend>
    <label for="ricerca">Ricerca per:</label><br>
    <input list="ricerca" name="ricerca">           
	<datalist id="ricerca" name="ricerca">
		<option value="Username utente"></option>
		<option value="Marca auto"></option>
		<option value="Id noleggio"></option>		
  </datalist><br><br>     
    <input type=text name="filtro" value="" required>
  
    <input type="submit" name="action" value="cerca per campo">
  </fieldset>
</form>
<br><br><br>
<form action="/Nolejava/gestisciNoleggioServlet" method="POST">
  <fieldset>
    <legend>Ricerca prenotazioni per data</legend>
	<input type="date" placeholder="Data inizio noleggio" name="datainizio" value="" required>
		<br>
		<input type="date" placeholder="Data fine noleggio" name="datafine" value="" required>
		<br>      
    <input type="submit" name="action" value="cerca per date">
  </fieldset>
</form>


<% 
	Utente utente = (Utente) request.getSession().getAttribute(Costanti.USER_IN_SESSION);
	List<Noleggio> listaNoleggio = (List<Noleggio>) request.getSession().getAttribute(Costanti.LISTA_COMPLETA_NOLEGGI);
	if (listaNoleggio!=null && !listaNoleggio.isEmpty()) {
%>
		<table>
			<tr>
				<th>id Noleggio</th>
				<th>Data prenotazione</th>		
				<th>Data inizio noleggio</th>
				<th>Data fine noleggio</th>	
				<th>Marca auto</th>	
				<th>Modello auto</th>	
				<th>Cliente</th>
<%
	if (utente.getRuolo().getId() == Costanti.ID_RUOLO_ADMIN) {
%>					
				<th>Operazioni</th>	
<%
	}
%>					
			</tr>
<% 
	for (int i=0; i<listaNoleggio.size();i++){
		Noleggio noleggioCorrente = listaNoleggio.get(i);
		Integer idNoleggio = noleggioCorrente.getIdNoleggio();
		Date dataPrenotazione = noleggioCorrente.getDataPrenotazione();
		Date dataInizio = noleggioCorrente.getDataInizio();
		Date dataFine = noleggioCorrente.getDataFine();
		String marca = noleggioCorrente.getAuto().getMarca();
		String modello = noleggioCorrente.getAuto().getModello();
		String username = noleggioCorrente.getUtente().getUsername();
		String operazione = "Cancella noleggio";
%>
	<tr>
				<td><%=idNoleggio%></td>
				<td><%=dataPrenotazione%></td>
				<td><%=dataInizio%></td>
				<td><%=dataFine%></td>
				<td><%=marca%></td>
				<td><%=modello%></td>	
				<td><%=username%></td>
<%
		if (utente.getRuolo().getId() == Costanti.ID_RUOLO_ADMIN) {
%>										
				<td>		
				<form action="/Nolejava/gestisciNoleggiServlet" method="POST">
					<input type="hidden" name="idnoleggio" value="<%=idNoleggio%>">					
				    <input type="submit" name="action" value="Cancella noleggio">
				</form>					
				</td>	
<%
		}
%>										
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