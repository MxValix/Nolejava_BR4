<%@page import="com.comunenapoli.progetto.utils.Costanti"%>
<%@page import="com.comunenapoli.progetto.model.Auto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modifica Auto</title>
</head>
<h1>Modifica Auto</h1>

<%
	Auto auto = (Auto)request.getSession().getAttribute(Costanti.AUTO_IN_SESSION);
	Integer idAuto = auto.getIdAuto();
	String marca = auto.getMarca();
	String modello = auto.getModello();
	String tipoCarburante = auto.getTipoCarburante();
	String tipologiaAuto = auto.getTipologiaAuto();
	String cambio = auto.getCambio();
	String colore = auto.getColore();
	String targa = auto.getTarga();
	String urlImg = auto.getUrlImg();
	Double cilindrata = auto.getCilindrata();
	Integer numeroPosti = auto.getNumeroPosti();
	Double prezzoPerGiorno = auto.getPrezzoPerGiorno();

%>

<form action="/Nolejava/operazioniAutoServlet" method="POST">
	<fieldset>
		<legend>Modifica auto:</legend>
		<input type="hidden" id="idAuto" name="idAuto" value="<%=idAuto%>"required> 
		<label for="marca">Marca:</label><br> <input
			type="text" id="marca" name="marca" value="<%=marca%>" required><br>
		<br> <label for="modello">Modello:</label><br> <input
			type="text" id="modello" name="modello" value="<%=modello%>" required><br>
		<br> <label for="cilindrata">Cilindrata:</label><br> <input
			type="text" id="cilindrata" name="cilindrata" value="<%=cilindrata%>"
			required><br>
		<br> <label for="numeroposti">Numero posti auto:</label><br>
		<input type="text" id="numeroposti" name="numeroposti"
			value="<%=numeroPosti%>" required><br>
		<br> <label for="tipocarburante">Tipo carburante:</label><br>
		<input type="text" id="tipocarburante" name="tipocarburante"
			value="<%=tipoCarburante%>" required><br>
		<br> <label for="tipologiaauto">Tipologia auto:</label><br>
		<input list="tipologiaauto" name="tipologiaauto"
			value="<%=tipologiaAuto%>" required>
		<datalist id="tipologiaauto" name="tipologiaauto">
			<option value="Berlina"></option>
			<option value="Utilitaria"></option>
			<option value="Suv"></option>
			<option value="Station Wagon"></option>
			<option value="Sportiva"></option>
			<option value="Minivan"></option>
		</datalist>
		<br>
		<br> <label for="cambio">Cambio:</label><br> <input
			type="text" id="cambio" name="cambio" value="<%=cambio%>"><br>
		<br> <label for="colore">Colore:</label><br> <input
			type="text" id="colore" name="colore" value="<%=colore%>"><br>
		<br> <label for="targa">Targa:</label><br> <input
			type="text" id="targa" name="targa" value="<%=targa%>"><br>
		<br> <label for="prezzopergiorno">Prezzo per giorno:</label><br>
		<input type="text" id="prezzopergiorno" name="prezzopergiorno"
			value="<%=prezzoPerGiorno%>"><br>
		<br> <label for="imgurl">Url immagine:</label><br> <input
			type="text" id="imgurl" name="imgurl" value="<%=urlImg%>"><br>
		<br> <input type="submit" name="action" value="Modifica auto">
	</fieldset>
</form>

</body>
</html>
