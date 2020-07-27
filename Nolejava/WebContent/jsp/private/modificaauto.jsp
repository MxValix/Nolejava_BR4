<%@page import="com.comunenapoli.progetto.model.Utente"%>
<%@page import="com.comunenapoli.progetto.model.Auto"%>
<%@page import="com.comunenapoli.progetto.utils.Costanti"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	
	Utente utente= (Utente) request.getSession().getAttribute(Costanti.USER_IN_SESSION);
	if (utente.getRuolo().getId() == 1){

%>


<!DOCTYPE html>
<html lang="en">

<head>
  <title>Modifica auto</title>
  <meta charset="utf-8">
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
                  <a class="nav-link" href="/Nolejava/">Homepage</a>
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

      <h3 style="color: #FFFFFFCC;">Modifica auto</h3>

      <div class="container-fluid mb-5" style="background-color: rgb(36, 37, 38); border-radius: 0.25rem;">
        <form action="/Nolejava/operazioniAutoServlet" method="POST">
          <div class="row">
            <input type="hidden" id="idAuto" name="idAuto" value="<%=idAuto%>">
            <div class="col-md-4 col-lg-4 col-xl-4 mt-2 d-flex flex-column">
              <label for="marca">Marca:</label>
              <input class="form-control" type="text" id="marca" name="marca" value="<%=marca%>"
                placeholder="Inserisci marca" required>
            </div>
            <div class="col-md-4 col-lg-4 col-xl-4 mt-2 d-flex flex-column">
              <label for="modello">Modello:</label>
              <input class="form-control" type="text" id="modello" name="modello" value="<%=modello%>"
                placeholder="Inserisci modello" required>
            </div>
            <div class="col-md-4 col-lg-4 col-xl-4 mt-2 d-flex flex-column">
              <label for="cilindrata">Cilindrata:</label>
              <input class="form-control" type="text" id="cilindrata" name="cilindrata" value="<%=cilindrata%>"
                placeholder="Inserisci cilindrata" required>
            </div>
            <div class="col-md-4 col-lg-4 col-xl-4 mt-2 d-flex flex-column">
              <label for="numeroposti">Numero posti auto:</label>
              <input class="form-control" type="text" id="numeroposti" name="numeroposti" value="<%=numeroPosti%>"
                placeholder="Inserisci posti auto" required>
            </div>
            <div class="col-md-4 col-lg-4 col-xl-4 mt-2 d-flex flex-column">
              <label for="tipocarburante">Tipo carburante:</label>
              <input class="form-control" type="text" id="tipocarburante" name="tipocarburante"
                value="<%=tipoCarburante%>" placeholder="Inserisci tipo carburante" required>
            </div>
            <div class="col-md-4 col-lg-4 col-xl-4 mt-2 d-flex flex-column">
              <label for="tipologiaauto">Tipologia auto:</label>
              <input class="form-control" list="tipologiaauto" name="tipologiaauto"
                placeholder="Inserisci tipologia auto" value="<%=tipologiaAuto%>" required>
              <datalist id="tipologiaauto" name="tipologiaauto">
                <option value="Berlina"></option>
                <option value="Utilitaria"></option>
                <option value="Suv"></option>
                <option value="Station Wagon"></option>
                <option value="Sportiva"></option>
                <option value="Minivan"></option>
              </datalist>
            </div>
            <div class="col-md-4 col-lg-4 col-xl-4 mt-2 d-flex flex-column">
              <label for="cambio">Cambio:</label>
              <input class="form-control" type="text" id="cambio" name="cambio" value="<%=cambio%>"
                placeholder="Inserisci il tipo di cambio" required>
            </div>
            <div class="col-md-4 col-lg-4 col-xl-4 mt-2 d-flex flex-column">
              <label for="colore">Colore:</label>
              <input class="form-control" type="text" id="colore" name="colore" value="<%=colore%>"
                placeholder="Inserisci il colore" required>
            </div>
            <div class="col-md-4 col-lg-4 col-xl-4 mt-2 d-flex flex-column">
              <label for="targa">Targa:</label>
              <input class="form-control" type="text" id="targa" name="targa" value="<%=targa%>"
                placeholder="Inserisci la targa" required>
            </div>
            <div class="col-md-4 col-lg-4 col-xl-4 mt-2 mb-md-4 d-flex flex-column">
              <label for="prezzopergiorno">Prezzo per giorno:</label>
              <input class="form-control" type="text" id="prezzopergiorno" name="prezzopergiorno"
                value="<%=prezzoPerGiorno%>" placeholder="Inserisci prezzo per giorno" required>
            </div>
            <div class="col-md-4 col-lg-4 col-xl-4 mt-2 mb-4 d-flex flex-column">
              <label for="imgurl">Url immagine:</label>
              <input class="form-control" type="text" id="imgurl" name="imgurl" value="<%=urlImg%>"
                placeholder="Inserisci url immagine" required>
            </div>

            <div class="col-md-4 col-lg-4 col-xl-4 mt-2 mb-4 d-flex flex-column">
              <input class="form-control btn btn-primary mt-auto" type="submit" name="action" value="Modifica Auto">
            </div>
          </div>
        </form>
      </div>


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

<%
	}
%>