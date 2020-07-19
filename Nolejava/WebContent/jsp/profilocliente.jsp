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
	<form action="/Nolejava/profiloClienteServlet" method="POST">
		<input type="hidden" name="idUtente" value="<%=idUtente%>"> <br>
		<input type="text" placeholder="nome" name="nome" value="<%=nome%>"> <br>
		 <input type="text" placeholder="cognome" name="cognome" value="<%=cognome%>"><br>
		<input type="date" placeholder="data di nascita" name="dataNascita" value="<%=dataNascita%>" readonly><br>
		<input type="text" placeholder="email" name="email" value="<%=email%>"> <br>
		<input type="password" placeholder="password" name="password" value="<%=password%>"><br>
		<input type="submit" value="Modifica profilo"><br>
	
	</form>
</body>
</html>