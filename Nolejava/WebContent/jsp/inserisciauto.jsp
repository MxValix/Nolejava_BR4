<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inserisci Auto</title>
</head>
<h1>Inserisci Auto</h1>

<form action="/Nolejava/operazioniAutoServlet" method="POST">
  <fieldset>
    <legend>Inserisci una nuova auto:</legend>
	<label for="marca">Marca:</label><br>
    <input type="text" id="marca" name="marca" value="" placeholder="Inserisci marca" required><br><br>    
    <label for="modello">Modello:</label><br>
    <input type="text" id="modello" name="modello" value="" placeholder="Inserisci modello" required><br><br>
    <label for="cilindrata">Cilindrata:</label><br>
    <input type="text" id="cilindrata" name="cilindrata" value="" placeholder="Inserisci cilindrata" required><br><br>
    <label for="numeroposti">Numero posti auto:</label><br>
    <input type="text" id="numeroposti" name="numeroposti" value="" placeholder="Inserisci posti auto" required><br><br>
        <label for="tipocarburante">Tipo carburante:</label><br>
    <input type="text" id="tipocarburante" name="tipocarburante" value="" placeholder="Inserisci tipo carburante" required><br><br>
            <label for="tipologiaauto">Tipologia auto:</label><br>
   <input list="tipologiaauto" name="tipologiaauto" placeholder="Inserisci tipologia auto" required>           
   <datalist id="tipologiaauto" name="tipologiaauto">
		<option value="Berlina"></option>
		<option value="Utilitaria"></option>
		<option value="Suv"></option>		
		<option value="Station Wagon"></option>
		<option value="Sportiva"></option>
		<option value="Minivan"></option>		
  </datalist><br><br>
                <label for="cambio">Cambio:</label><br>
    <input type="text" id="cambio" name="cambio" value="" placeholder="Inserisci il tipo di cambio" required><br><br>
                <label for="colore">Colore:</label><br>
    <input type="text" id="colore" name="colore" value="" placeholder="Inserisci il colore" required><br><br> 
                <label for="targa">Targa:</label><br>
    <input type="text" id="targa" name="targa" value="" placeholder="Inserisci la targa" required><br><br>                     
    <label for="prezzopergiorno">Prezzo per giorno:</label><br>
    <input type="text" id="prezzopergiorno" name="prezzopergiorno" value="" placeholder="Inserisci prezzo per giorno" required><br><br>    
                <label for="imgurl">Url immagine:</label><br>
    <input type="text" id="imgurl" name="imgurl" value="" placeholder="Inserisci url immagine" required><br><br> 
     
    <input type="submit" name="action" value="Aggiungi auto">
  </fieldset>
</form>
      
</body>
</html>
