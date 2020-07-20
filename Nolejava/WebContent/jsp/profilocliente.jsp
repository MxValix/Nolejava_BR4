<%@page import="com.comunenapoli.progetto.model.Utente"%>
<%@page import="java.sql.Date"%>
<%@page import="com.comunenapoli.progetto.utils.Costanti"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profilo Cliente</title>
</head>
<body>
<% 
	Utente utente = (Utente) request.getSession().getAttribute(Costanti.USER_IN_SESSION);
	Integer idUtente = utente.getIdUtente();
	String nome = utente.getNome();
	String cognome = utente.getCognome();
	Date dataNascita = utente.getDataNascita();
	String email = utente.getUsername();
	String password = utente.getPassword();	
%>


	<form action="/Nolejava/logoutServlet" method="post">
       	<input type="submit" value="Logout">
	 </form>
	 <br><br><br>
	<form action="/Nolejava/profiloClienteServlet" method="post">
	    <input type="submit" name="action" value="Aggiorna dati personali">   
	    <input type="submit" name="action" value="Aggiorna dati carta">     
     	<input type="submit" name="action" value="Gestisci prenotazioni">    	    		      	
 	</form>
 	
</body>
</html>