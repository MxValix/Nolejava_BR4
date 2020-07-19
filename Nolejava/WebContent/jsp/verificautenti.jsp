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

<h1> Verifica utenti</h1>

<%
	Utente utente = (Utente) request.getSession().getAttribute(Costanti.USER_IN_SESSION);
	Integer ruoloUtente = utente.getRuolo().getId();
	List<Utente> utentiNonVerificati = (List<Utente>) request.getAttribute(Costanti.LISTA_UTENTI_NON_VERIFICATI);
	if (utentiNonVerificati!=null && !utentiNonVerificati.isEmpty()){
		if (ruoloUtente==Costanti.ID_RUOLO_ADMIN){	
%>
		
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
				<form action="/Nolejava/GestisciUtentiServlet" method="POST">
					<input type="hidden" name="idutente" value="<%=idUtente%>">
					<input type="hidden" value= "<%=email%>" name="recipient"/> 	 		     	
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


</body>
</html>