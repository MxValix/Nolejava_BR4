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
<title>Insert title here</title>
</head>
<body>
<h1> Verifica utenti</h1>

<% 
	Utente utente = (Utente) request.getSession().getAttribute(Costanti.USER_IN_SESSION);
	List<Noleggio> listaPrenotazioni = (List<Noleggio>) request.getSession().getAttribute(Costanti.NOLEGGI_UTENTE);

	if (listaPrenotazioni!=null && !listaPrenotazioni.isEmpty()) {
%>
		<table>
			<tr>
				<th>id Noleggio</th>
				<th>Data prenotazione</th>		
				<th>Data inizio noleggio</th>
				<th>Data fine noleggio</th>	
				<th>Marca auto</th>	
				<th>Modello auto</th>	
				<th>Prenotazione</th>	
				
					
			</tr>
<% 
	for (int i=0; i<listaPrenotazioni.size();i++){
		Noleggio noleggioCorrente = listaPrenotazioni.get(i);
		Integer idNoleggio = noleggioCorrente.getIdNoleggio();
		Date dataPrenotazione = noleggioCorrente.getDataPrenotazione();
		Date dataInizio = noleggioCorrente.getDataInizio();
		Date dataFine = noleggioCorrente.getDataFine();
		String marca = noleggioCorrente.getAuto().getMarca();
		String modello = noleggioCorrente.getAuto().getModello();
		String operazione = "Cancella noleggio";
%>
	<tr>
				<td><%=idNoleggio%></td>
				<td><%=dataPrenotazione%></td>
				<td><%=dataInizio%></td>
				<td><%=dataFine%></td>
				<td><%=marca%></td>
				<td><%=modello%></td>						
				<td>
				<form action="/Nolejava/prenotazioniClienteServlet" method="POST">
					<input type="hidden" name="idnoleggio" value="<%=idNoleggio%>">
				    <input type="hidden" name="recipient" value="<%=utente.getUsername()%>">
					
				    <input type="submit" name="action" value="Cancella noleggio">
				</form>					
				</td>						
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