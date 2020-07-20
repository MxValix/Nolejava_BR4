<%@page import="java.sql.Date"%>
<%@page import="com.comunenapoli.progetto.model.Utente"%>
<%@page import="com.comunenapoli.progetto.utils.Costanti"%>
<%@page import="com.comunenapoli.progetto.model.Auto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	%>
<h1>Gestisci auto</h1>

<h2><a href="/jsp/inserisciauto.jsp">Inserisci auto</a></h2>

<h2>Ricerca auto con filtro</h2>
<form action="/Nolejava/gestisciAutoServlet" method="post">
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
		<input type="submit" name="action" value="Ricerca">
	</form>

<h2>Lista auto</h2>
<%
	List<Auto> listaAuto = (List<Auto>) request.getSession().getAttribute(Costanti.LISTA_COMPLETA_AUTO);
	Utente utente = (Utente) request.getSession().getAttribute(Costanti.USER_IN_SESSION);
	
	if (listaAuto!=null && !listaAuto.isEmpty()){
%>
		<table>
			<tr>
				<th>id auto</th>
				<th>Marca</th>		
				<th>Modello</th>
				<th>Cilindrata</th>
<%
		if (utente.getRuolo().getId() == Costanti.ID_RUOLO_ADMIN){
%>				
				<th>Operazione</th>		
<% 
		}
%>								
			</tr>
			
<%		
		for (int i=0; i<listaAuto.size();i++){
			Auto autoCorrente = listaAuto.get(i);
			Integer idAuto = autoCorrente.getIdAuto();
			String marca = autoCorrente.getMarca();
			String modello = autoCorrente.getModello();
			Double cilindrata = autoCorrente.getCilindrata();
%>		
			<tr>
				<td><%=idAuto%></td>
				<td><%=marca%></td>
				<td><%=modello%></td>
				<td><%=cilindrata%></td>
<%
		if (utente.getRuolo().getId() == Costanti.ID_RUOLO_ADMIN){
%>				
				<td>
				<form action="/Nolejava/gestisciAutoServlet" method="POST">
					<input type="hidden" name="idauto" value="<%=idAuto%>">
				    <input type="submit" name="action" value="Modifica">
				    <input type="submit" name="action" value="Cancella">
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