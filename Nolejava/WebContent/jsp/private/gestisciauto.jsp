<%@page import="java.sql.Date"%>
<%@page import="com.comunenapoli.progetto.model.Utente"%>
<%@page import="com.comunenapoli.progetto.utils.Costanti"%>
<%@page import="com.comunenapoli.progetto.model.Auto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  Date dataInizioNoleggio = (Date) request.getAttribute(Costanti.DATA_INIZIO_NOLEGGIO);
  Date dataFineNoleggio = (Date) request.getAttribute(Costanti.DATA_FINE_NOLEGGIO);
  String tipologiaAuto = (String) request.getAttribute(Costanti.TIPOLOGIA_AUTO_SCELTA);
  String marcaAuto = (String) request.getAttribute(Costanti.MARCA_AUTO_SCELTA);
  String modelloAuto = (String) request.getAttribute(Costanti.MODELLO_AUTO_SCELTA);
  String cambioAuto =  (String) request.getAttribute(Costanti.CAMBIO_AUTO_SCELTA);
  String carburanteAuto = (String) request.getAttribute(Costanti.CARBURANTE_AUTO_SCELTA);
  String numeroPosti = (String) request.getAttribute(Costanti.NUMERO_POSTI_AUTO_SCELTA);
  String voce1 = "";
  String voce2 = "";
  String link = "/Nolejava/jsp/";
  String link1 = link;
  String link2 = link;
  
  String operazione = "Ricerca";
  
  if (tipologiaAuto==null || tipologiaAuto.isEmpty()) {
     tipologiaAuto = "Scegli tipologia auto";
  }
  if (marcaAuto==null) marcaAuto = "";
  if (modelloAuto == null) modelloAuto = "";
  String bottoneNoleggio = "Cerca auto";
  Utente utente = (Utente)request.getSession().getAttribute(Costanti.USER_IN_SESSION);
  if(utente == null) {
      voce1 = "Registrati";
      link1 += "registrazione.jsp";
      voce2 = "Accedi";
      link2 += "login.jsp";
   }
   else{
      voce1 = "Profilo";
      voce2 = "Logout";
      link2 = "/Nolejava/logoutServlet";
      if (utente.getRuolo().getId()==Costanti.ID_RUOLO_CLIENTE){
         link1 += "profilocliente.jsp";   
         operazione = "Noleggia";

      } else {
         link1 += "dashboard.jsp";
      }
   }
  
  
  
  String dashboard = "DASHBOARD ";
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
<title>Gestisci auto</title>
<link rel="icon" type="image/png" href="/Nolejava/images/favicon.png"/>

 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

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
          <p id="paragrafo-dashboard" style="margin-right: auto !important;"><%=dashboard%></p>


          <!-- INIZIO NAVBAR-MOBILE -->
          <div id="navbar-mobile">


            <p style="margin-left:auto !important; margin-right:0 !important"><%=dashboard %></p>


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

      <h3 style="color: #FFFFFFCC;">Gestisci auto</h3>
      <div class="row">
        <div class="col-6 col-md-4 col-lg-3 col-xl-3">
          <a href='jsp/private/inserisciauto.jsp' class=" form-control btn btn-primary" style="padding: 4px;"> Aggiungi auto</a>
        </div>
      </div>


      <h4 class="mt-5" style="color: #FFFFFFCC;">Lista auto</h4>

      <form action="/Nolejava/gestisciAutoServlet" method="post">
        <div class="row">
          <div class="col-md-3 col-lg-3 col-xl-3 mt-2">
            <input class="form-control" type="date" placeholder="Data inizio noleggio" name="datainizio"
              value="<%=dataInizioNoleggio%>" required>
          </div>
          <div class="col-md-3 col-lg-3 col-xl-3 mt-2">
            <input class="form-control" type="date" placeholder="Data fine noleggio" name="datafine"
              value="<%=dataFineNoleggio%>" required>
          </div>
          <div class="col-md-2 col-lg-2 col-xl-2 mt-2">
            <select class="form-control" name="tipologia" id="tipologia">
              <option value="Berlina">Berlina</option>
              <option value="Utilitaria">Utilitaria</option>
              <option value="Suv">Suv</option>
              <option value="Station Wagon">Station Wagon</option>
              <option value="Sportiva">Sportiva</option>
              <option value="Minivan">Minivan</option>
            </select>
          </div>
          <div class="col-md-2 col-lg-2 col-xl-2 mt-2">
            <input class="form-control" type="text" name="marca" placeholder="Marca">
          </div>
          <div class="col-md-2 col-lg-2 col-xl-2 mt-2">
            <input class="form-control" type="text" name="modello" placeholder="Modello">
          </div>
          <div class="col-md-4 col-lg-3 col-xl-3 mt-3">
            <input class=" form-control btn btn-primary" name="action" type="submit" value="Ricerca auto disponibili">
          </div>
        </div>
      </form>
						
			
	<!-- FINE filtro-->

<%
	List<Auto> listaAuto = (List<Auto>) request.getSession().getAttribute(Costanti.LISTA_COMPLETA_AUTO);
	
	if (listaAuto!=null && !listaAuto.isEmpty()){
%>
		 <div class="tabella table-responsive mt-5">
        <table class="tabella table table-striped table-dark mr-5">
          <thead>
            <tr>
              <th>idAuto</th>
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
          </thead>
          <tbody>
			
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
              <td>		
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