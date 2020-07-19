<%@page import="com.comunenapoli.progetto.utils.Costanti"%>
<%@page import="com.comunenapoli.progetto.model.Utente"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gestisci utenti</title>
</head>
<body>
	<h1> Gestisci utenti</h1>
<%
	Utente utente = (Utente) request.getSession().getAttribute(Costanti.USER_IN_SESSION);
	Integer ruoloUtente = utente.getRuolo().getId();
	List<Utente> listaUtenti = (List<Utente>) request.getAttribute(Costanti.LISTA_UTENTI);

	if (listaUtenti!=null && !listaUtenti.isEmpty()){
%>
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
				    <input type="hidden" value= "<%=email%>" name="recipient"/> 	 		     					
					
<% 
				Integer idRuoloUtente = utenteCorrente.getRuolo().getId();
%>
<% 
				if (idRuoloUtente==Costanti.ID_RUOLO_CLIENTE && isVerificato) {
%>
			     	<input type="submit" name="action" value="Promuovi utente">
<% 
				}
				else if (idRuoloUtente!=Costanti.ID_RUOLO_ADMIN && !isVerificato) {
%>
				    <input type="submit" name="action" value="Verifica utente">
	
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