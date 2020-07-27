<%@page import="java.sql.Date"%>
<%@page import="com.comunenapoli.progetto.model.Noleggio"%>
<%@page import="java.util.List"%>
<%@page import="com.comunenapoli.progetto.model.Utente"%>
<%@page import="com.comunenapoli.progetto.utils.Costanti"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%Utente utente= (Utente) request.getSession().getAttribute(Costanti.USER_IN_SESSION);

if (utente.getRuolo().getId() == 1){

%>   
    
    
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Gestisci noleggi</title>
</head>

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">

  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css" rel="stylesheet">

  <link rel="stylesheet" href="/Nolejava/css/style-dashboard.css">

  <link rel="stylesheet" href="/Nolejava/css/my-style-dashboard.css">



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
      <nav id="navbar" style="min-height: 60px; border-radius:0.25rem;" class="navbar navbar-expand-lg navbar-light sticky">

        <div class="container-fluid ">
          <p id="paragrafo-dashboard" style="margin-right: auto !important;"> DASHBOARD ADMIN</p>


          <!-- INIZIO NAVBAR-MOBILE -->
          <div id="navbar-mobile">


            <p style="margin-left:auto !important; margin-right:0 !important"> DASHBOARD ADMIN</p>



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

      <h3 style="color: #FFFFFFCC;">Gestisci noleggi</h3>


















 <form action="/Nolejava/gestisciNoleggiServlet" method="post">
        <div class="row mt-4">
          <div class="col-lg-2 col-xl-2 mt-2">
            <label>Ricerca per campo:</label>
          </div>
          <div class="col-md-3 col-lg-3 col-xl-3 mt-2">
            <input class="form-control" list="ricerca" name="ricerca">
            <datalist id="ricerca" name="ricerca">
              <option value="Username utente"></option>
              <option value="Marca auto"></option>
            </datalist>
          </div>
          <div class="col-md-3 col-lg-3 col-xl-3 mt-2">
            <input class="form-control" type="text" name="filtro" value="" required>
          </div>
          <div class="col-md-3 col-lg-3 col-xl-3 col-md-4 mt-2">
            <input class="form-control btn btn-primary" type="submit" name="action" value="cerca per campo">
          </div>

        </div>
      </form>

      <form style="margin-top: 2%; margin-bottom: 5%;" action="/Nolejava/gestisciNoleggiServlet" method="post">
      <div class="row mt-4 mb-5">
        <div class=".col-lg-2 col-xl-2 mt-2">
          <label>Ricerca per date:</label>
        </div>
        <div class="col-md-3 col-lg-3 col-xl-3 mt-2">
          <input class="form-control" type="date" placeholder="Data inizio noleggio" name="datainizio" required>
        </div>
        <div class="col-md-3 col-lg-3 col-xl-3 mt-2">
          <input class="form-control" type="date" placeholder="Data fine noleggio" name="datafine" required>
        </div>
        <div class="col-md-3 col-lg-3 col-xl-3 mt-2">
          <input class="form-control btn btn-primary" type="submit" name="action"
            value="cerca per date">
        </div>
      </div>
      </form>




<% 
	List<Noleggio> listaNoleggio = (List<Noleggio>) request.getSession().getAttribute(Costanti.LISTA_COMPLETA_NOLEGGI);
	if (listaNoleggio!=null && !listaNoleggio.isEmpty()) {
%>
	<div class="tabella table-responsive">
        <table class="tabella table table-striped table-dark mr-5">
          <thead>
			<tr>
				<th>id Noleggio</th>
				<th>Data prenotazione</th>		
				<th>Data inizio noleggio</th>
				<th>Data fine noleggio</th>	
				<th>Marca auto</th>	
				<th>Modello auto</th>	
				<th>Cliente</th>
<%
	if (utente.getRuolo().getId() == Costanti.ID_RUOLO_ADMIN) {
%>					
				<th>Operazioni</th>	
<%
	}
%>					
			</tr>
			</thead>
          <tbody>
<% 
	for (int i=0; i<listaNoleggio.size();i++){
		Noleggio noleggioCorrente = listaNoleggio.get(i);
		Integer idNoleggio = noleggioCorrente.getIdNoleggio();
		Date dataPrenotazione = noleggioCorrente.getDataPrenotazione();
		Date dataInizio = noleggioCorrente.getDataInizio();
		Date dataFine = noleggioCorrente.getDataFine();
		String marca = noleggioCorrente.getAuto().getMarca();
		String modello = noleggioCorrente.getAuto().getModello();
		String username = noleggioCorrente.getUtente().getUsername();
		String operazione = "Cancella noleggio";
%>
	<tr>
				<td><%=idNoleggio%></td>
				<td><%=dataPrenotazione%></td>
				<td><%=dataInizio%></td>
				<td><%=dataFine%></td>
				<td><%=marca%></td>
				<td><%=modello%></td>	
				<td><%=username%></td>
<%
		if (utente.getRuolo().getId() == Costanti.ID_RUOLO_ADMIN) {
%>										
				<td>		
				<form action="/Nolejava/gestisciNoleggiServlet" method="POST">
					<input type="hidden" name="idnoleggio" value="<%=idNoleggio%>">					
				    <input type="submit" name="action" value="Cancella noleggio">
				</form>					
				</td>	
<%
		}
%>										
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

<%
}
%>