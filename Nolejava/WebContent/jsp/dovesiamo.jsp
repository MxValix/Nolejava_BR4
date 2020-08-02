<%@page import="com.comunenapoli.progetto.utils.Costanti"%>
<%@page import="com.comunenapoli.progetto.model.Utente"%>
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
    <title>NoleJava - Dove Siamo</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 	<link rel="icon" type="image/png" href="/Nolejava/images/favicon.png"/>
 
    <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap"
        rel="stylesheet">

    <link rel="stylesheet" href="/Nolejava/css/open-iconic-bootstrap.min.css">
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
    <link rel="stylesheet" href="/Nolejava/css/my-style.css" />

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
					<li class="nav-item active"><a href="<%=link%>dovesiamo.jsp" class="nav-link">Dove siamo</a></li>
					<li class="nav-item"><a href="<%=link%>contact.jsp" class="nav-link">Contattaci</a></li>
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
                    <p class="breadcrumbs"><span class="mr-2"><a href="/Nolejava/">Home <i
                                    class="ion-ios-arrow-forward"></i></a></span> <span>Dove siamo <i
                                class="ion-ios-arrow-forward"></i></span></p>
                    <h1 class="mb-3 bread">Dove siamo</h1>
                </div>
            </div>
        </div>
    </section>
    <!-- FINE intestazione -->

    <!-- INIZIO recapiti e ottieni indicazioni -->
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
                    <h2 class="text-center">NoleJava si trova presso l'aeroporto Internazionale di Napoli Capodichino
                    </h2>
                    <form class="text-center input-group mb-3" action="http://maps.google.com/maps" method="GET" target="blank">
                        <input type="text" class="form-control" placeholder="Inserisci il tuo indirizzo di partenza..." name='saddr' aria-describedby="button-addon2"/>
                        <input type="hidden" name='daddr' value="Viale F. Ruffo di Calabria, 19, 80144 Napoli NA">
                        <div class="input-group-append col-12 col-md-4 justify-content-center">
                        <input id="button-addon2" type="submit" value="Ottieni indicazioni" class="btn btn-primary mt-4 mt-md-0">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
    <!-- INIZIO recapiti e ottieni indicazioni -->

    <!--INIZIO Google Maps-->
    <div id="map-container-google-1" class="z-depth-1-half map-container"
        style="height: 500px; width: 100%; padding: 0px;">
        <iframe
            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d4924.57639312165!2d14.280878359372837!3d40.8746157187203!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x133b07f89684aff9%3A0xc6d2a18d5ab2cada!2sViale%20F.%20Ruffo%20di%20Calabria%2C%2019%2C%2080144%20Napoli%20NA!5e0!3m2!1sit!2sit!4v1595454788800!5m2!1sit!2sit"
            frameborder="0" style="border:0" allowfullscreen></iframe>
    </div>
    <!--FINE Google Maps-->

    <!-- INIZIO navetta -->
    <section class="ftco-section">
        <div class="container">
            <div class="row no-gutters">
                <div class="col-md-6 p-md-5 img img-2 d-flex justify-content-center align-items-center"
                    style="background-image: url(/Nolejava/images/GESAC_mappa_navetta_RAC_marzo2020_-_tipo_2.jpg);">
                </div>
                <div class="col-md-6 wrap-about py-md-5 ftco-animate">
                    <div class="heading-section mb-5 pl-md-5">
                        <span class="subheading">NoleJava</span>
                        <h2 class="mb-4">Servizio gratuito di navetta</h2>
                        <p class="text-justify">Per raggiungere NoleJava, è a disposizione dei passeggeri dell'aeroporto
                            di Capodichino il servizio gratuito di navetta situata, uscendo dagli arrivi, all'interno
                            del P5, con frequenza ogni 5 minuti.</p>
                        <p class="text-justify">Per maggiori informazioni sul servizio, non esitare a contattarci
                            premendo il bottone qui sotto.</p>
                        <p class="text-center"><a href="contact.jsp" class="btn btn-primary">Contattaci</a></p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- FINE navetta -->

    	<jsp:include page="footer.jsp"></jsp:include>




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