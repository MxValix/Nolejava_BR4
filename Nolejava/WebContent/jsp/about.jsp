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
	       link1 += "dashboard.jsp";
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
						<span class="mr-2"><a href="index.html">Home <i
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
			<div class="row no-gutters">
				<div
					class="col-md-6 p-md-5 img img-2 d-flex justify-content-center align-items-center"
					style="background-image: url(/Nolejava/images/about.jpg);"></div>
				<div class="col-md-6 wrap-about py-md-5 ftco-animate">
					<div class="heading-section mb-5 pl-md-5">
						<span class="subheading">About us</span>
						<h2 class="mb-4">NoleJava</h2>
						<p class="text-justify">NoleJava è il nuovo servizio di
							noleggio auto offerto dal Comune di Napoli.</p>
						<p class="text-justify">Accessibile da smartphone, tablet e
							computer, con il suo sistema di prenotazioni facile e sicuro, che
							tua sia un residente o un turista appena arrivato in città ,
							NoleJava, è pronta per ogni tua esigenza. Con oltre 40 modelli
							di oltre 10 marchi con un'età  media di soli tre mesi,
							l'offerta di NoleJava non è solo la flotta di autoveicoli più
							variegata, bensì anche la più giovane e attrattiva della città.
							Il nostro staff, disponibile h24, è sempre pronto ad assistere i
							propri clienti, prima, durante e dopo il noleggio. Per noi il
							cliente è al primo posto.</p>
						<p>
							<a href="index.html" class="btn btn-primary">Ricerca veicoli</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- FINE about us -->

	<!-- INIZIO i nostri servizi-->
	<section class="ftco-section services-section">
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
								Lo staff di NoleJava Ã¨ sempre disponibile <a
									href="/Nolejava/html/contact.html">Contattaci qui</a>
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
								Prenotazione online facile, rapida e sicura <a href="#filtro">Cerca
									qui la tua auto</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- FINE i nostri servizi-->

	<!-- INIZIO footer-->
	<footer class="ftco-footer ftco-bg-dark ftco-section">
		<div class="container">
			<div class="row mb-5">
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">About NoleJava</h2>
						<p>NoleJava Ã¨ il nuovo servizio di noleggio auto offerto dal
							Comune di Napoli.</p>
						<ul
							class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
							<li class="ftco-animate"><a href="#"><span
									class="icon-twitter"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-facebook"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-instagram"></span></a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4 ml-md-5">
						<h2 class="ftco-heading-2">Informazioni</h2>
						<ul class="list-unstyled">
							<li><a href="about.html" class="py-2 d-block">Chi siamo</a></li>
							<li><a href="where-we-are.html" class="py-2 d-block">Dove
									siamo</a></li>
							<li><a href="#" class="py-2 d-block">Term and Conditions</a></li>
							<li><a href="#" class="py-2 d-block">Privacy &amp;
									Cookies Policy</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Recapiti</h2>
						<div class="block-23 mb-3">
							<ul>
								<li><span class="icon icon-map-marker"></span><span
									class="text">Viale F. Ruffo di Calabria 19, 80144 Napoli
										NA</span></li>
								<li><a href="/Nolejava/html/contact.html"><span
										class="icon icon-phone"></span><span class="text">081
											060 8349</span></a></li>
								<li><a href="/Nolejava/html/contact.html"><span
										class="icon icon-envelope"></span><span class="text">info@nolejava.com</span></a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Servizio clienti</h2>
						<ul class="list-unstyled">
							<li><a href="contact.html" class="py-2 d-block">Contattaci</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 text-center">
					<p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>document.write(new Date().getFullYear());</script>
						All rights reserved | NoleJava
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>
			</div>
		</div>
	</footer>
	<!-- FINE footer-->



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