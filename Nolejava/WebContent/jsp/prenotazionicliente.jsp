<%@page import="java.sql.Date"%>
<%@page import="com.comunenapoli.progetto.model.Noleggio"%>
<%@page import="java.util.List"%>
<%@page import="com.comunenapoli.progetto.model.Utente"%>
<%@page import="com.comunenapoli.progetto.utils.Costanti"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
    Utente utente = (Utente) request.getSession().getAttribute(Costanti.USER_IN_SESSION);
    List<Noleggio> listaPrenotazioni = (List<Noleggio>) request.getSession().getAttribute(Costanti.NOLEGGI_UTENTE);
%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>NoleJava - Le tue prenotazioni</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap"
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
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="/Nolejava/css/my-style.css">	
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>

</head>

<body>


	<!-- INIZIO nav-->
	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="index.html">Nole<span>java</span></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>
			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a href="index.html" class="nav-link">Home</a></li>
					<li class="nav-item"><a href="about.html" class="nav-link">Chi
							siamo</a></li>
					<li class="nav-item"><a href="where-we-are.html"
						class="nav-link">Dove siamo</a></li>
					<li class="nav-item"><a href="#" class="nav-link">Contattaci</a></li>
					<li class="nav-item"><a href="profilo.html" class="nav-link">Profilo</a></li>
					<li class="nav-item"><a href="logout.html" class="nav-link">Logout</a></li>
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
								class="ion-ios-arrow-forward"></i></a></span> <span>Profilo<i
							class="ion-ios-arrow-forward"></i></span>
					</p>
					<h1 class="mb-3 bread">Le tue prenotazioni</h1>
				</div>
			</div>
		</div>
	</section>
	<!-- FINE intestazione -->

	<!-- INIZIO form -->
	<section class="ftco-section contact-section">

		<div class="container">
			<div class="row">


				<div class="col-md-12">
					<%
    if (listaPrenotazioni!=null && !listaPrenotazioni.isEmpty()) {
%>
					<div class="table-responsive">


						<table id="mytable" class="table table-bordred table-striped">

							<thead>

								<th>#</th>
								<th>Data prenotazione</th>
								<th>Data inizio noleggio</th>
								<th>Data fine noleggio</th>
								<th>Marca auto</th>
								<th>Modello auto</th>
								<th>Prenotazione</th>

							</thead>
							<tbody>

								<% 
    for (int i=0; i<listaPrenotazioni.size();i++){
        Noleggio noleggioCorrente = listaPrenotazioni.get(i);
        Integer idNoleggio = noleggioCorrente.getIdNoleggio();
        Date dataPrenotazione = noleggioCorrente.getDataPrenotazione();
        Date dataInizio = noleggioCorrente.getDataInizio();
        Date dataFine = noleggioCorrente.getDataFine();
        String marca = noleggioCorrente.getAuto().getMarca();
        String modello = noleggioCorrente.getAuto().getModello();
        String operazione = "Cancella noleggio";
%>

								<tr>
									<td><%=idNoleggio%></td>
									<td><%=dataPrenotazione%></td>
									<td><%=dataInizio%></td>
									<td><%=dataFine%></td>
									<td><%=marca%></td>
									<td><%=modello%></td>

									<td>
										<form action="/Nolejava/prenotazioniClienteServlet"
											method="POST">
											<input type="hidden" name="idnoleggio"
												value="<%=idNoleggio%>"> <input type="hidden"
												name="recipient" value="<%=utente.getUsername()%>">
											<p data-placement="top" data-toggle="tooltip" title="Delete">
												<button id="cancellanoleggio" class="btn btn-danger btn-xs"
													data-title="Cancella noleggio" data-toggle="modal"
													data-target="#delete" name="action"
													value="Cancella noleggio" type="submit">
													<span class=" "> <i class="fa fa-trash"></i>
													</span>
												</button>
											</p>
										</form>
									</td>
								</tr>
								<%
        }
%>
							</tbody>
						</table>
						<%
    }
%>

					</div>

				</div>
			</div>
		</div>



		<!-- /.modal-dialog -->
		</div>



		<div class="modal fade" id="delete" tabindex="-1" role="dialog"
			aria-labelledby="edit" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">
							<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
						</button>
						<h4 class="modal-title custom_align" id="Heading">Elimina la
							tua prenotazione</h4>
					</div>
					<div class="modal-body">

						<div class="alert alert-danger">
							<span class="glyphicon glyphicon-warning-sign"></span> Sei sicuro
							di voler cancellare la tua prenotazione?
						</div>

					</div>
					<div class="modal-footer ">
						<button type="button" class="btn btn-success">
							<span class="glyphicon glyphicon-ok-sign"></span> Si
						</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">
							<span class="glyphicon glyphicon-remove"></span> No
						</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
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
						<p>NoleJava è il nuovo servizio di noleggio auto offerto dal
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
						<script>
                            document.write(new Date().getFullYear());
                        </script>
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
	<script src="/Nolejava/js/script.js"></script>
	<script src="/Nolejava/js/prova.js"></script>
	<script src="https://use.fontawesome.com/b9bdbd120a.js"></script>
	<script src="/Nolejava/js/bootstrap-datetimepicker.min.js"></script>

</body>

</html>