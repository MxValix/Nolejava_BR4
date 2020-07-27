<%@page import="com.comunenapoli.progetto.model.Utente"%>
<%@page import="com.comunenapoli.progetto.utils.Costanti"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Utente utente = (Utente)request.getSession().getAttribute(Costanti.USER_IN_SESSION);
	String voce1 = "";
	String voce2 = "";
	String link = "/Nolejava/jsp/";
	String link1 = link;
	String link2 = link;
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
	    } else {
	       link1 += "private/dashboard.jsp";
	    }
	 }
%>  
<!DOCTYPE html>
<html lang="en">
<head>
  <title>NoleJava - Contattaci</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="icon" type="image/png" href="/Nolejava/images/favicon.png"/>
<link rel="icon" type="image/png" href="/Nolejava/images/favicon.png"/>

  <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap"
    rel="stylesheet">

  <link rel="stylesheet" href="/Nolejava/ss/open-iconic-bootstrap.min.css">
  <link rel="stylesheet" href="/Nolejava/css/animate.css">

  <link rel="stylesheet" href="/Nolejava/css/owl.carousel.min.css">
  <link rel="stylesheet" href="/Nolejava/css/owl.theme.default.min.css">
  <link rel="stylesheet" href="/Nolejava/css/magnific-popup.css">

  <link rel="stylesheet" href="/Nolejava/css/aos.css">

  <link rel="stylesheet" href="/Nolejava/css/ionicons.min.css">

  <link rel="stylesheet" href="/Nolejava/css/bootstrap-datepicker.css">
  <link rel="stylesheet" href="/Nolejava/css/jquery.timepicker.css">


  <link rel="stylesheet" href="/Nolejava/css/flaticon.css">
  <link rel="stylesheet" href="/Nolejava/css/icomoon.css">
  <link rel="stylesheet" href="/Nolejava/css/style.css">
</head>

<body>


	<!-- INIZIO nav-->
	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="/Nolejava/">Nole<span>java</span></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>
			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a href="/Nolejava/"
						class="nav-link">Home</a></li>
					<li class="nav-item"><a href="<%=link%>about.jsp" class="nav-link">Chi
							siamo</a></li>
					<li class="nav-item"><a href="<%=link%>dovesiamo.jsp"
						class="nav-link">Dove siamo</a></li>
					<li class="nav-item active"><a href="<%=link%>contact.jsp" class="nav-link">Contattaci</a></li>
					<li class="nav-item"><a href="<%=link1%>" class="nav-link"><%=voce1%></a></li>
					<li class="nav-item"><a href="<%=link2%>" class="nav-link"><%=voce2%></a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- FINE nav -->

  <!-- INIZIO intestazione -->
  <section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('/Nolejava/images/bg_2.jpg');"
    data-stellar-background-ratio="0.5">
    <div class="overlay"></div>
    <div class="container">
      <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
        <div class="col-md-9 ftco-animate pb-5">
          <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home <i
                  class="ion-ios-arrow-forward"></i></a></span> <span>Contattaci <i
                class="ion-ios-arrow-forward"></i></span></p>
          <h1 class="mb-3 bread">Contattaci</h1>
        </div>
      </div>
    </div>
  </section>
  <!-- FINE intestazione -->

  <!-- INIZIO form -->
  <section class="ftco-section contact-section">
    <div class="container">
      <div class="row d-flex mb-5 contact-info justify-content-center">
        <div class="col-md-8">
          <div class="row mb-5">
            <div class="col-md-4 text-center py-4">
              <div class="icon">
                <span class="icon-map-o"></span>
              </div>
              <p><span>Indirizzo:</span> Viale F. Ruffo di Calabria 19, 80144 Napoli NA</p>
            </div>
            <div class="col-md-4 text-center border-height py-4">
              <div class="icon">
                <span class="icon-mobile-phone"></span>
              </div>
              <p><span>Telefono:</span> <a href="tel://0810608349">081 060 8349</a></p>
            </div>
            <div class="col-md-4 text-center py-4">
              <div class="icon">
                <span class="icon-envelope-o"></span>
              </div>
              <p><span>Email:</span> <a href="mailto:info@nolejava.com">info@nolejava.com</a></p>
            </div>
          </div>
        </div>
      </div>
      <div class="row block-9 justify-content-center mb-5">
        <div class="col-md-8 mb-md-5">
          <h2 class="text-center">Per qualsiasi domanda o richiesta di supporto <br>non esitate a contattarci</h2>
          
          <form action="/Nolejava/emailSendingServletContacts" method="POST" class="bg-light p-5 contact-form">
            <div class="form-group">
              <input type="text" class="form-control" placeholder="Nome" name="nome" required>
            </div>
            <div class="form-group">
              <input type="text" class="form-control" placeholder="Email" name="email" required>
            </div>
            <div class="form-group">
              <input type="text" class="form-control" placeholder="Oggetto" name="oggetto" required>
            </div>
            <div class="form-group">
              <textarea cols="30" rows="7" class="form-control" placeholder="Messaggio" name="messaggio" required></textarea>
            </div>
            <div class="form-group justify-content-center text-center">
              <input type="submit" value="Invia Messaggio" class="btn btn-primary py-3 px-5">
            </div>
          </form>
          
<%
		if (request.getAttribute("Message") != null){
%>		
			<div class="col-md-12" style="text-align: center">
				<h4 style="color: rgb(110, 224, 112)"><%=request.getAttribute("Message")%></h4>
			</div>
		
<%
		}
%>

        </div>
      </div>
    </div>
  </section>
  <!-- FINE form -->


<%--   	<jsp:include page="footer.jsp"></jsp:include> --%>
  



  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px">
      <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
      <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10"
        stroke="#F96D00" /></svg></div>


  <script src="/Nolejava/js/jquery.min.js"></script>
  <script src="/Nolejava/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="/Nolejava/js/popper.min.js"></script>
  <script src="/Nolejava/js/bootstrap.min.js"></script>
  <script src="/Nolejava/js/jquery.easing.1.3.js"></script>
  <script src="/Nolejava/js/jquery.waypoints.min.js"></script>
  <script src="/Nolejava/js/jquery.stellar.min.js"></script>
  <script src="/Nolejava/js/owl.carousel.min.js"></script>
  <script src="/Nolejava/js/jquery.magnific-popup.min.js"></script>
  <script src="/Nolejava/js/aos.js"></script>
  <script src="/Nolejava/js/jquery.animateNumber.min.js"></script>
  <script src="/Nolejava/js/bootstrap-datepicker.js"></script>
  <script src="/Nolejava/js/jquery.timepicker.min.js"></script>
  <script src="/Nolejava/js/scrollax.min.js"></script>
  <script
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="/Nolejava/js/google-map.js"></script>
  <script src="/Nolejava/js/main.js"></script>

</body>

</html>