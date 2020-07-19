<%@page import="java.sql.Date"%>
<%@page import="com.comunenapoli.progetto.model.Utente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.comunenapoli.progetto.model.Auto"%>
<%@page import="java.util.List"%>
<%@page import="com.comunenapoli.progetto.utils.Costanti"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Homepage</title>
</head>
<body>


	<%
		Date dataInizioNoleggio = (Date) request.getSession().getAttribute(Costanti.DATA_INIZIO_NOLEGGIO);
		Date dataFineNoleggio = (Date) request.getSession().getAttribute(Costanti.DATA_FINE_NOLEGGIO);
		String tipologiaAuto = (String) request.getSession().getAttribute(Costanti.TIPOLOGIA_AUTO_SCELTA);
		String marcaAuto = (String) request.getSession().getAttribute(Costanti.MARCA_AUTO_SCELTA);
		String modelloAuto = (String) request.getSession().getAttribute(Costanti.MODELLO_AUTO_SCELTA);

		if (tipologiaAuto==null || tipologiaAuto.isEmpty()) {
			tipologiaAuto = "Scegli tipologia auto";
		}
		if (marcaAuto==null) marcaAuto = "";
		if (modelloAuto == null) modelloAuto = "";
		String bottoneNoleggio = "Noleggio";
			Utente utente = (Utente)request.getSession().getAttribute(Costanti.USER_IN_SESSION);
		if(utente == null){
			bottoneNoleggio = "Dettagli";
	%>
	<form action="/Nolejava/jsp/registrazione.jsp" method="post">
		<input type="submit" value="Registrati">
	</form>
	<form action="/Nolejava/jsp/login.jsp" method="post">
		<input type="submit" value="Login">
	</form>

	<%}else{
		if (utente.getRuolo().getId()==Costanti.ID_RUOLO_CLIENTE){
	%>

	<form action="/Nolejava/jsp/profilocliente.jsp" method="post">
		<input type="submit"
			value="Profilo-<%=utente.getRuolo().getNomeRuolo()%>">
	</form>

	<%}else{ %>
	<form action="/Nolejava/jsp/dashboard.jsp" method="post">
		<input type="submit"
			value="Profilo-<%=utente.getRuolo().getNomeRuolo()%>">
	</form>
	<%}
	}%>

	<br>
	<br>
	<br>
	<br>
	<br>

	<form action="/Nolejava/homepageServlet" method="post">
		<input type="hidden" name="formcompliato" value="1"> 
		<input type="date" placeholder="Data inizio noleggio" name="datainizio" value="<%=dataInizioNoleggio%>" required>
		<br>
		<input type="date" placeholder="Data fine noleggio" name="datafine" value="<%=dataFineNoleggio%>" required>
		<br>
		<select name="tipologia" id="tipologia">
			<option disabled selected><%=tipologiaAuto%></option>
			<option value="berlina">Berlina</option>
			<option value="utilitaria">Utilitaria</option>
			<option value="suv">Suv</option>
		</select> 
		<br>
		<input type="text" name="marca" value="<%=marcaAuto%>">
		<br>
		<input type="text" name="modello" value="<%=modelloAuto%>">
		<br>
		<input type="submit" value="<%=bottoneNoleggio%>">
	</form>

	<%List<Auto> automobili =  
            (ArrayList<Auto>)request.getSession().getAttribute(Costanti.LISTA_COMPLETA_AUTO); 
        for(Auto a:automobili){%>
	<tr>
		<td><%=a.getMarca()%></td>
		<form action="/Nolejava/autoServlet" method="POST">
			<input type="hidden" name="idautobtn" value="<%=a.getIdAuto()%>">
			<input type="submit" value="Vai all'auto">
		</form>
	</tr>
	<%}%>
</body>
</html>