<%@page import="com.comunenapoli.progetto.model.CartaDiCredito"%>
<%@page import="com.comunenapoli.progetto.utils.Costanti"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 	
	CartaDiCredito carta = (CartaDiCredito) request.getAttribute(Costanti.CARTA_IN_SESSION);
	String numeroCarta = "";
	String cvv =  "";
	String idCarta = "";


	String operazioneCarta = "Crea carta";
	if (carta!=null){
		operazioneCarta = "Aggiorna carta";
		numeroCarta = carta.getNumeroCarta();
		idCarta = carta.getIdCartaDiCredito().toString();
		cvv = carta.getCvv().toString();
	}
	
 %>    
<!doctype html>
<html lang="en">
<head>
	<title>Nolejava - Carta di credito</title>

	<meta charset="utf-8">

	<!-- bootstrap stylesheet -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">

	<!-- font awesome -->
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

	<!-- easycard stylesheet -->
	<link rel="stylesheet" type="text/css" href="/Nolejava/css/easycard.min.css">
    <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="/Nolejava/ss/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="/Nolejava/css/animate.css">

    <link rel="stylesheet" href="/Nolejava/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/Nolejava/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="/Nolejava/css/magnific-popup.css">

    <link rel="stylesheet" href="/Nolejava/css/aos.css">

    <link rel="stylesheet" href="/Nolejava/css/ionicons.min.css">

    <link rel="stylesheet" href="/Nolejava/css/bootstrap-datepicker.css">


    <link rel="stylesheet" href="/Nolejava/css/flaticon.css">
    <link rel="stylesheet" href="/Nolejava/css/icomoon.css">
    <link rel="stylesheet" href="/Nolejava/css/style.css">
</head>

<body>

    <!-- INIZIO nav-->
    <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
        <div class="container">
            <a class="navbar-brand" href="index.html">Nole<span>java</span></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="oi oi-menu"></span> Menu
      </button>
            <div class="collapse navbar-collapse" id="ftco-nav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item"><a href="index.html" class="nav-link">Home</a></li>
                    <li class="nav-item"><a href="about.html" class="nav-link">Chi siamo</a></li>
                    <li class="nav-item"><a href="where-we-are.html" class="nav-link">Dove siamo</a></li>
                    <li class="nav-item"><a href="#" class="nav-link">Contattaci</a></li>
                    <li class="nav-item"><a href="profilo.html" class="nav-link">Profilo</a></li>
                    <li class="nav-item"><a href="logout.html" class="nav-link">Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- FINE nav -->

    <!-- INIZIO intestazione -->
    <section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('/Nolejava/images/bg_2.jpg');" data-stellar-background-ratio="0.5">
        <div class="overlay"></div>
        <div class="container">
            <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
                <div class="col-md-9 ftco-animate pb-5">
                    <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home <i
                  class="ion-ios-arrow-forward"></i></a></span> <span>Carta di credito <i
                class="ion-ios-arrow-forward"></i></span></p>
                    <h1 class="mb-3 bread">Carta di credito</h1>
                </div>
            </div>
        </div>
    </section>
    <!-- FINE intestazione -->

<div class="col-md-8 mx-auto my-5">
	<div class="row">
		<div class="col-md-6">
			<div class="card">
				<div class="card-header bg-primary text-center text-white">Dati della Carta di Credito</div>
				<div class="panel-block my-3">
					<div class="col-md-12">
                        <form action="/Nolejava/cartaServlet" method="POST">
						<div class="form-group">
							<label>Nome e cognome</label>
							<input type="text" class="form-control" id="name" value="">
						</div>
						<div class="form-group">
							<label>Numero di carta</label>
							<div class="input-group">
								<input type="text" class="form-control" id="number" name="numerocarta" required>
								<div class="input-group-addon"><i class="fa fa-credit-card"></i></div>
							</div>
						</div>
						<div class="form-group">
							<div class="row">
								<div class="col-md-8">
									<label>Data di scadenza</label>
									<div class="input-group">
										<select class="form-control" id="date-m" name="mesescadenza" required>
											<option>MM</option>
											<option value="01">01</option>
											<option value="02">02</option>
											<option value="03">03</option>
											<option value="04">04</option>
											<option value="05">05</option>
											<option value="06">06</option>
											<option value="07">07</option>
											<option value="08">08</option>
											<option value="09">09</option>
											<option value="10">10</option>
											<option value="11">01</option>
											<option value="12">02</option>
										</select>
										<select class="form-control" id="date-y" name="annoscadenza" required>
											<option>YY</option>
											<option value="2020">20</option>
											<option value="2021">21</option>
											<option value="2022">22</option>
											<option value="2023">23</option>
											<option value="2024">24</option>
										</select>
									</div>
								</div>
								<div class="col-md-4">
									<label>CVV</label>
									<input type="text" class="form-control" id="cvc" name="cvv">
								</div>
							</div>
						</div>
						<div class="form-group">
						<input type="submit" class="form-control btn btn-primary" value="CONFERMA CARTA">
                        </div>
                    </form>    
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-6">
			<div class="cc-wrapper"></div>
		</div>
	</div>
</div>


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
                                <li><a href="/Nolejava/html/contact.html"><span class="icon icon-phone"></span><span class="text">081 060
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
    <script src="/Nolejava/js/bootstrap-datepicker.js"></script>
    <script src="/Nolejava/js/jquery.timepicker.min.js"></script>
    <script src="/Nolejava/js/scrollax.min.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
    <script src="/Nolejava/js/google-map.js"></script>
    <script src="/Nolejava/js/main.js"></script>
    <script src="/Nolejava/js/script.js"></script>
<!-- bootstrap javascripts -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>

<!-- easycard plugin -->
<script type="text/javascript" src="/Nolejava/js/easycard.min.js"></script>

<script type="text/javascript">
$('.cc-wrapper').easycard();
</script>
</body>
</html>