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
	    voce2 = "Logout";
	    link2 = "/Nolejava/logoutServlet";
	    if (utente.getRuolo().getId()==Costanti.ID_RUOLO_CLIENTE){
		   voce1 = "Profilo";
	       link1 += "privata/profilocliente.jsp";   	
	    } else {
	    	 voce1 = "Dashboard";
	         link1 = "/Nolejava/notificheDashboard";
	    }
	 }
%>  
<!DOCTYPE html>
<html lang="en">

<head>
<title>NoleJava - Chi siamo</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="icon" type="image/png" href="/Nolejava/images/favicon.png"/>

<link
	href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="/Nolejava/css/open-iconic-bootstrap.min.css">
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
					<li class="nav-item active"><a href="<%=link%>about.jsp" class="nav-link">Chi
							siamo</a></li>
					<li class="nav-item"><a href="<%=link%>dovesiamo.jsp"
						class="nav-link">Dove siamo</a></li>
					<li class="nav-item"><a href="<%=link%>contact.jsp" class="nav-link">Contattaci</a></li>
					<li class="nav-item"><a href="<%=link1%>" class="nav-link"><%=voce1%></a></li>
					<li class="nav-item"><a href="<%=link2%>" class="nav-link"><%=voce2%></a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- FINE nav -->

	<!-- INIZIO intestazione -->
	<section class="hero-wrap hero-wrap-2 js-fullheight"
		style="background-image: url('/Nolejava/images/bg_2.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
				<div class="col-md-9 ftco-animate pb-5">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="/Nolejava/">Home <i
								class="ion-ios-arrow-forward"></i></a></span> <span>Chi siamo <i
							class="ion-ios-arrow-forward"></i></span>
					</p>
					<h1 class="mb-3 bread">Chi siamo</h1>
				</div>
			</div>
		</div>
	</section>
	<!-- FINE intestazione -->


	<!-- INIZIO about us -->
	<section class="ftco-section">
		<div class="container">
					<div class="row justify-content-center mt-2">
				<div class="col-md-12 heading-section text-center ftco-animate mb-5">
					<span class="subheading">About us</span>
					<h2 class="mb-2">NoleJava</h2>
				</div>
			</div>
			<div class="row no-gutters">
				<div
					class="col-md-6 p-md-5 img img-2 d-flex justify-content-center align-items-center"
					style="background-image: url(/Nolejava/images/about.jpg);"></div>
				<div class="col-md-6 wrap-about ftco-animate">
					<div class="heading-section pl-md-5">
						<p class="text-justify mb-1">NoleJava &egrave; il nuovo servizio di
							noleggio auto offerto dal Comune di Napoli.</br>Accessibile da smartphone, tablet e
							computer, con il suo sistema di prenotazioni facile e sicuro, che
							tua sia un residente o un turista appena arrivato in città ,
							NoleJava, è pronta per ogni tua esigenza. Con oltre 40 modelli
							di oltre 10 marchi con un&#39;età media di soli tre mesi,
							l&#39;offerta di Nolejava non è solo la flotta di autoveicoli più
							variegata, bensì anche la più giovane e attrattiva della città.
							Il nostro staff, disponibile h24, &egrave; sempre pronto ad assistere i
							propri clienti, prima, durante e dopo il noleggio. Per noi il
							cliente &egrave; al primo posto.</p>
						<p>
							<a href="/Nolejava/jsp/homepage.jsp#lista-auto" class="btn btn-primary col-8 offset-2 col-lg-4 offset-lg-4">Ricerca veicoli</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- FINE about us -->

	<!-- INIZIO i nostri servizi-->
	<section class="ftco-section services-section pt-0">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-12 heading-section text-center ftco-animate mb-5">
					<span class="subheading">NoleJava</span>
					<h2 class="mb-2">I nostri servizi</h2>
				</div>
			</div>
			<div class="row d-flex">
				<div class="col-md-4 d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services">
						<div class="media-body py-md-4">
							<div class="d-flex mb-3 align-items-center">
								<div class="icon">
									<span class="flaticon-customer-support"></span>
								</div>
								<h3 class="heading mb-0 pl-3">Supporto 24/7</h3>
							</div>
							<p>
								Lo staff di NoleJava è sempre disponibile <a
									href="/Nolejava/jsp/contact.jsp">Contattaci qui</a>
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-4 d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services">
						<div class="media-body py-md-4">
							<div class="d-flex mb-3 align-items-center">
								<div class="icon">
									<span class="flaticon-online-booking"></span>
								</div>
								<h3 class="heading mb-0 pl-3">Profilo personale</h3>
							</div>
							<p>Gestione facile e sicura dei propri dati personali e delle
								proprie prenotazioni</p>
						</div>
					</div>
				</div>
				<div class="col-md-4 d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services">
						<div class="media-body py-md-4">
							<div class="d-flex mb-3 align-items-center">
								<div class="icon">
									<span class="flaticon-rent"></span>
								</div>
								<h3 class="heading mb-0 pl-3">Prenotazione</h3>
							</div>
							<p>
								Prenotazione online facile, rapida e sicura <a href="/Nolejava/jsp/homepage.jsp#lista-auto">Cerca
									qui la tua auto</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- FINE i nostri servizi-->

	<jsp:include page="footer.jsp"></jsp:include>



	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
      <circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
      <circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>


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