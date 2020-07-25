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
	       link1 += "profilocliente.jsp";   	
	    } else {
	       link1 += "dashboard.jsp";
	    }
	 }
%>  
<!DOCTYPE html>
<html lang="en">

<head>
    <title>NoleJava - Login</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

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
					<li class="nav-item"><a href="<%=link%>contact.jsp" class="nav-link">Contattaci</a></li>
					<li class="nav-item"><a href="<%=link1%>" class="nav-link"><%=voce1%></a></li>
					<li class="nav-item active"><a href="<%=link2%>" class="nav-link"><%=voce2%></a></li>
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
                                    class="ion-ios-arrow-forward"></i></a></span> <span>Login <i
                                class="ion-ios-arrow-forward"></i></span></p>
                    <h1 class="mb-3 bread">Login</h1>
                </div>
            </div>
        </div>
    </section>
    <!-- FINE intestazione -->

    <!-- INIZIO form -->
    <section class="ftco-section contact-section">
        <div class="container">

            <div class="row block-9 justify-content-center mb-5">
                <div class="col-md-8 mb-md-5">
                    <h2 class="text-center">Bentornato</h2>
                    <form action="/Nolejava/loginServlet" method="POST" class="bg-light p-5 contact-form">
                        <div class="form-group">
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="basic-addon1">@</span>
                                </div>
                                <input type="email" class="form-control" name="email" placeholder="Inserisci email"
                                    aria-label="email" aria-describedby="basic-addon1" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="input-group mb-3">
                                <input type="password" class="form-control" name="password"
                                    placeholder="Inserisci password" aria-label="password" id="input-pwd"
                                    pattern=".{8,12}" required>
                                <div class="input-group-append">
                                    <span class="input-group-text toggle-password">
                                        <i class="fa fa-fw fa-eye"></i>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <input type="hidden" name="staff" value="">
                        <div class="form-group">
                            <input type="submit" value="Effettua Login" class="form-control btn btn-primary">
                        </div>
                        <p class="text-center">Non sei ancora registrato? <a href="registrazione.html">Registrati
                                ora</a></p>
                    </form>
                </div>
            </div>
    </section>
    <!-- FINE form -->


    <!-- INIZIO footer-->
    <footer class="ftco-footer ftco-bg-dark ftco-section">
        <div class="container">
            <div class="row mb-5">
                <div class="col-md">
                    <div class="ftco-footer-widget mb-4">
                        <h2 class="ftco-heading-2">About NoleJava</h2>
                        <p>NoleJava è il nuovo servizio di noleggio auto offerto dal Comune di Napoli.</p>
                        <ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
                            <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                            <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                            <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md">
                    <div class="ftco-footer-widget mb-4 ml-md-5">
                        <h2 class="ftco-heading-2">Informazioni</h2>
                        <ul class="list-unstyled">
                            <li><a href="about.html" class="py-2 d-block">Chi siamo</a></li>
                            <li><a href="where-we-are.html" class="py-2 d-block">Dove siamo</a></li>
                            <li><a href="#" class="py-2 d-block">Term and Conditions</a></li>
                            <li><a href="#" class="py-2 d-block">Privacy &amp; Cookies Policy</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md">
                    <div class="ftco-footer-widget mb-4">
                        <h2 class="ftco-heading-2">Recapiti</h2>
                        <div class="block-23 mb-3">
                            <ul>
                                <li><span class="icon icon-map-marker"></span><span class="text">Viale F. Ruffo di
                                        Calabria 19, 80144 Napoli NA</span></li>
                                <li><a href="/Nolejava/html/contact.html"><span class="icon icon-phone"></span><span
                                            class="text">081 060
                                            8349</span></a></li>
                                <li><a href="/Nolejava/html/contact.html"><span class="icon icon-envelope"></span><span
                                            class="text">info@nolejava.com</span></a></li>
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
                        <script>
                            document.write(new Date().getFullYear());
                        </script> All rights reserved | NoleJava
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    </p>
                </div>
            </div>
        </div>
    </footer>
    <!-- FINE footer-->



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
    <script src="/Nolejava/js/scrollax.min.js"></script>
    <script
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
    <script src="/Nolejava/js/google-map.js"></script>
    <script src="/Nolejava/js/main.js"></script>
    <script src="/Nolejava/js/script.js"></script>
    <script src="https://use.fontawesome.com/b9bdbd120a.js"></script>

</body>

</html>