<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>
</head>
<body>
	<form action="/Nolejava/LogoutServlet" method="post">
     	<input type="submit" value="Logout">
 	</form>
 	
 	<br><br><br><br>
	<form action="/Nolejava/dashboardServlet" method="post">
     	<input type="submit" name="action" value="Gestisci utente">
	    <input type="submit" name="action" value="Gestisci auto">   
   	    <input type="submit" name="action" value="Gestisci noleggi">     	
	      	
 	</form>
 	
 	

</body>
</html>