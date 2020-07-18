<%@page import="com.comunenapoli.progetto.utils.Costanti"%>
<%@page import="com.comunenapoli.progetto.model.Utente"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Verifica utenti</title>
</head>
<body>
<%
	Utente utente = (Utente) request.getSession().getAttribute(Costanti.USER_IN_SESSION);
	Integer ruoloUtente = utente.getRuolo().getId();
	List<Utente> listaUtenti = (List<Utente>) request.getAttribute(Costanti.LISTA_UTENTI);
	List<Utente> utentiNonVerificati = (List<Utente>) request.getAttribute(Costanti.LISTA_UTENTI_NON_VERIFICATI);
	if (utentiNonVerificati!=null && !utentiNonVerificati.isEmpty()){
		if (ruoloUtente==Costanti.ID_RUOLO_ADMIN){	
%>
		<h1> Gestisci verifica utenti</h1>
		<table>
			<tr>
				<th>id</th>
				<th>email</th>
				<th>tipologia</th>	
				<th>operazione</th>		
					
			</tr>
			
<% 		
		for (int i=0; i<utentiNonVerificati.size();i++){
			
			Utente utenteCorrente = utentiNonVerificati.get(i);
			Integer idUtente = utenteCorrente.getIdUtente();
			String email = utenteCorrente.getUsername();
			String tipologia = utenteCorrente.getRuolo().getNomeRuolo();
%>	
			<tr>

				<td><%=idUtente%></td>	
				<td><%=email%></td>		
				<td><%=tipologia%></td>	
				<td>
				<form action="/Nolejava/gestisciUtenti" method="POST">
					<input type="hidden" name="idutente" value="<%=idUtente%>"> 		     	
			     	<input type="submit" name="action" value="Verifica utente">
<% 
				}
%>				
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
<%
	if (listaUtenti!=null && !listaUtenti.isEmpty()){
%>
		<h1> Gestisci utenti</h1>
		<table>
			<tr>
				<th>id</th>
				<th>email</th>
				<th>tipologia</th>	
				<th>verificato</th>
				<th>operazione</th>		
					
			</tr>
		
<% 		
		for (int i=0; i<listaUtenti.size();i++){
			
			Utente utenteCorrente = listaUtenti.get(i);
			Integer idUtente = utenteCorrente.getIdUtente();
			String email = utenteCorrente.getUsername();
			String tipologia = utenteCorrente.getRuolo().getNomeRuolo();
			boolean isVerificato = utenteCorrente.getIsVerificato();
			String verificato = "";
			if (isVerificato){
				verificato = "sì"; 
			} else {
				verificato = "no";
			}
%>	
			<tr>
				<td><%=idUtente%></td>	
				<td><%=email%></td>		
				<td><%=tipologia%></td>	
				<td><%=verificato%></td>	
				<td>
				<form action="/Nolejava/gestisciUtenti" method="POST">
					<input type="hidden" name="idutente" value="<%=idUtente%>"> 
<% 
				Integer idRuoloUtente = utenteCorrente.getRuolo().getId();
				if (idRuoloUtente==Costanti.ID_RUOLO_CLIENTE) {
%>
			     	<input type="submit" name="action" value="Promuovi utente">
<% 
				}
				if (ruoloUtente==Costanti.ID_RUOLO_ADMIN && idRuoloUtente!=Costanti.ID_RUOLO_ADMIN){	
%>			     	
    				<input type="submit" name="action" value="Elimina utente">   
<% 
			}
%>				
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