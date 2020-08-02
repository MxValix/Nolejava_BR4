<%@page import="com.comunenapoli.progetto.utils.Costanti"%>
<%@page import="com.comunenapoli.progetto.model.Utente"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
String dashboard = "DASHBOARD ";
Utente utente = (Utente) request.getSession().getAttribute(Costanti.USER_IN_SESSION);
if (utente.getRuolo().getId() == Costanti.ID_RUOLO_ADMIN){
	dashboard += "ADMIN";
}else{
	dashboard += "STAFF";
}

%> 
    
    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gestisci utenti</title>
	
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="icon" type="image/png" href="/Nolejava/images/favicon.png"/>

  <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">

  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css" rel="stylesheet">

  <link rel="stylesheet" href="/Nolejava/css/style-dashboard.css">

  <link rel="stylesheet" href="/Nolejava/css/my-style-dashboard.css">
    
	
</head>
<body>

	 <div class="wrapper d-flex align-items-stretch">

    <!-- INIZIO sidebar -->
    <nav id="sidebar">
      <div class="p-4 pt-3">
        <img class="logo-dashboard" src="/Nolejava/images/nolejava-vector.svg">
       

        <ul class="list-unstyled components mb-5">
          <li>
            <a href="/Nolejava/notificheDashboard">Dashboard</a>
          </li>
          <li>
            <a href="/Nolejava">Homepage</a>
          </li>
          <li>
            <form action="/Nolejava/logoutServlet" method="post">
              <input id="logout" type="submit" value="Logout">
            </form>
          </li>
        </ul>

        <div class="footer">
          <p>
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            Copyright ©
            <script>document.write(new Date().getFullYear());</script>
          <p>All rights reserved | NoleJava</p>
          <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
          </p>
        </div>

      </div>
    </nav>
    <!-- FINE sidebar -->



    <!-- Page Content  p-4 p-md-5-->
    <div id="content" class="p-4 p-md-3">

      <!-- INIZIO NAVBAR -->
      <nav id="navbar" style="min-height: 60px;" class="navbar navbar-expand-lg navbar-light sticky">

        <div class="container-fluid ">
          <p id="paragrafo-dashboard" style="margin-right: auto !important;"> <%=dashboard%></p>


          <!-- INIZIO NAVBAR-MOBILE -->
          <div id="navbar-mobile">


            <p style="margin-left:auto !important; margin-right:0 !important"> <%=dashboard%></p>



            <button class="btn btn-primary d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse"
            data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
            aria-label="Toggle navigation">
            <i class="fa fa-bars"></i>
          </button>

          <img class="d-inline-block d-lg-none ml-auto" src="/Nolejava/images/nolejava-vector.svg" alt="" style="float: right !important; margin-left: 100px !important; width: 40%; height: 40px !important;">

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="nav navbar-nav">
                <li class="nav-item active">
                  <a class="nav-link" href="/Nolejava/notificheDashboard">Dashboard</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="/Nolejava">Homepage</a>
                </li>
                <li class="nav-item">
                  <form action="/Nolejava/logoutServlet" method="post">
                    <input id="logout" type="submit" value="Logout">
                  </form>
                </li>
              </ul>
            </div>



          </div>
          <!-- FINE NAVBAR-MOBILE -->

          <button type="button" id="sidebarCollapse" class="ml-auto btn btn-primary">
            <i class="fa fa-bars"></i>
            <span class="sr-only">Toggle Menu</span>
          </button>

        </div>
      </nav>
      <!-- FINE NAVBAR -->


    <!------- QUI Tabella-------->
    
    <h3 style="color: #FFFFFFCC;">Gestisci utenti</h3>
    
  	
<%
	Integer ruoloUtente = utente.getRuolo().getId();
	List<Utente> listaUtenti = (List<Utente>) request.getAttribute(Costanti.LISTA_UTENTI);


	if (listaUtenti!=null && !listaUtenti.isEmpty()){
%>
		<div class="tabella table-responsive">
    	<table class="tabella table table-striped table-dark mr-5">
        <thead>
			<tr>
				<th>id</th>
				<th>email</th>
				<th>tipologia</th>	
				<th>verificato</th>
				<th>operazione</th>		
					
			</tr>
			</thead>
			<tbody>
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

				if (idRuoloUtente==Costanti.ID_RUOLO_CLIENTE && isVerificato) {
%>
			     	<input type="submit" name="action" value="Promuovi utente">
<% 
				}
				else if (idRuoloUtente!=Costanti.ID_RUOLO_ADMIN && !isVerificato && ruoloUtente==Costanti.ID_RUOLO_ADMIN) {
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
	 </tbody>
	</table>
	</div>
<%
}
%>

<!------- FINE Tabella-------->

      <footer id="footer" style="height: 50px; background-color: rgb(36, 37, 38);">

        <div class="footer" style="text-align: center">
          <p>
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            Copyright ©
            <script>document.write(new Date().getFullYear());</script>
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            All rights reserved | NoleJava
          </p>
        </div>

      </footer>

    </div>


  </div>

  <script src="/Nolejava/js/jquery.min.js"></script>
  <script src="/Nolejava/js/popper.js"></script>
  <script src="/Nolejava/js/bootstrap.min.js"></script>
  <script src="/Nolejava/js/main-dashboard.js"></script>


</body>
</html>