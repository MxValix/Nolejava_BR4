<%@page import="java.sql.Date"%>
<%@page import="com.comunenapoli.progetto.model.Utente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.comunenapoli.progetto.model.Auto"%>
<%@page import="java.util.List"%>
<%@page import="com.comunenapoli.progetto.utils.Costanti"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
  List<Auto> automobili =  (List<Auto>)request.getSession().getAttribute(Costanti.LISTA_COMPLETA_AUTO); 
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
  String voceListaAuto = "Scegli la tua auto";
  if (automobili==null || automobili.size()==0){
	  voceListaAuto = "Spiacenti, non ci sono auto corrispondenti alla tua ricerca";
  }
  String operazione = "Dettagli";
  
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
      voce2 = "Logout";
      link2 = "/Nolejava/logoutServlet";
      if (utente.getRuolo().getId()==Costanti.ID_RUOLO_CLIENTE){
         voce1 = "Profilo";
         link1 += "privata/profilocliente.jsp";   
         operazione = "Noleggia";

      } else {
    	 voce1 = "Dashboard";
         link1 = "/Nolejava/notificheDashboard";
      }
   }
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Nolejava - Home</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="pragma" content="no-cache">
<link rel="icon" type="image/png" href="/Nolejava/images/favicon.png"/>
<link rel="stylesheet" href="/Nolejava/fonts/poppins.css">
<link rel="stylesheet"
	href="/Nolejava/css/open-iconic-bootstrap.min.css" type="text/css" />
<link rel="stylesheet" href="/Nolejava/css/animate.css" type="text/css" />
<link rel="stylesheet" href="/Nolejava/css/owl.carousel.min.css">
<link rel="stylesheet" href="/Nolejava/css/owl.theme.default.min.css">
<link rel="stylesheet" href="/Nolejava/css/magnific-popup.css">
<link rel="stylesheet" href="/Nolejava/css/aos.css">
<link rel="stylesheet" href="/Nolejava/css/ionicons.min.css">
<link rel="stylesheet" href="/Nolejava/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="/Nolejava/css/jquery.timepicker.css">
<link rel="stylesheet" href="/Nolejava/css/flaticon.css">
<link rel="stylesheet" href="/Nolejava/css/icomoon.css">
<link rel="stylesheet" href="/Nolejava/css/style.css" />
<link rel="stylesheet" href="/Nolejava/css/my-style.css?v=0.2" />
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
					<li class="nav-item active"><a href="/Nolejava/"
						class="nav-link">Home</a></li>
					<li class="nav-item"><a href="<%=link%>about.jsp" class="nav-link">Chi
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
	<!-- INIZIO video -->
	<header>
		<div class="overlay"></div>
		<video playsinline="playsinline" autoplay="autoplay" muted="muted"
			loop="loop">
			<source src="/Nolejava/video/nolejava.mp4" type="video/mp4">
		</video>
		<div class="container h-100">
			<div class="d-flex h-100 text-center align-items-center">
				<div class="w-100">
					<span class="display-3 nolejava">Nole</span> <span
						class="display-3 nolejavaGiallo">Java</span>
					<p class="lead mb-0 text-white">Ora è finalmente facile
						noleggiare un'auto a Napoli</p>
				</div>
			</div>
		</div>
	</header>
	<!-- FINE video-->
	<!-- INIZIO filtro -->
	<section id="filtro" class="ftco-section ftco-no-pb ftco-no-pt">
		<div class="container">
			<div class="row">
				<div class="col-md-12 mt-5">
					<div class="search-wrap-1 ftco-animate">
						<form action="/Nolejava/homepageServlet" method="post"
							class="search-property-1">
							<input type="hidden" value="formcompliato" name="formcompilato">
							<div class="row" id="prima-riga-filtri">
								<div class="col-lg align-items-end">
									<div class="form-group">
										<input type="hidden" name="formcompliato" value="1"> <label
											for="datainizio">Data di ritiro</label>
										<div class="form-field">
											<div class="select-wrap">
												<input type="date" name="datainizio" id="datainizio"
													value="<%=dataInizioNoleggio%>" class="form-control"
													required>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg align-items-end">
									<div class="form-group">
										<label for="datafine">Data di riconsegna</label>
										<div class="form-field">
											<div class="select-wrap">
												<input type="date" name="datafine" id="datafine"
													value="<%=dataFineNoleggio%>" class="form-control" required>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg align-items-end">
									<div class="form-group">
										<label for="tipologiaAuto">Tipologia Auto</label>
										<div class="form-field">
											<div class="select-wrap">
												<input list="tipologia" name="tipologia"
													class="form-control">
												<datalist id="tipologia" name="tipologia">
													<option value="Berlina"></option>
													<option value="Utilitaria"></option>
													<option value="Suv"></option>
													<option value="Station Wagon"></option>
													<option value="Sportiva"></option>
													<option value="Minivan"></option>
												</datalist>
												<br> <br>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg align-items-end">
									<div class="form-group">
										<label for="cambioAuto">Tipologia Cambio</label>
										<div class="form-field">
											<div class="select-wrap">
												<input list="cambio" name="cambio" class="form-control">
												<datalist id="cambio" name="cambioAuto">
													<option value="Automatico"></option>
													<option value="Manuale"></option>
												</datalist>
												<br> <br>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="row" id="seconda-riga-filtri">
								<div class="col-lg align-items-end">
									<div class="form-group">
										<label for="marca">Marca Auto</label>
										<div class="form-field">
											<div class="select-wrap">
												<input type="text" name="marca" id="marca"
													value="<%=marcaAuto%>" class="form-control">
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg align-items-end">
									<div class="form-group">
										<label for="modelloAuto">Modello Auto</label>
										<div class="form-field">
											<div class="select-wrap">
												<input type="text" name="modello" id="modello"
													value="<%=modelloAuto%>" class="form-control">
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg align-items-end">
									<div class="form-group">
										<label for="numeroPosti">Numero posti</label>
										<div class="form-field">
											<div class="select-wrap">
												<input list="numeroPosti" name="numeroPosti"
													class="form-control" value="5">
												<datalist id="numeroPosti" name="numeroPosti">
													<option value="2"></option>
													<option value="3"></option>
													<option value="4"></option>
													<option value="5"></option>
													<option value="6"></option>
													<option value="7"></option>
													<option value="8"></option>
													<option value="9"></option>
												</datalist>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg align-items-end">
									<div class="form-group">
										<label for="carburante">Tipologia carburante</label>
										<div class="form-field">
											<div class="select-wrap">
												<input list="carburante" name="carburante"
													class="form-control">
												<datalist id="carburante" name="carburante">
													<option value="Benzina"></option>
													<option value="Diesel"></option>
													<option value="GPL"></option>
													<option value="Elettrica"></option>
												</datalist>
												<br> <br>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-8 col-lg-4 offset-2 offset-lg-4 align-self-end">
									<div class="form-group">
										<div class="form-field">
											<input type="submit" value="<%=bottoneNoleggio%>"
												class="form-control btn btn-primary">
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- FINE filtro-->
	<!-- INIZIO le nostre auto-->
	<section id="lista-auto" class="ftco-section ftco-no-pb ftco-no-pt">
		<div class="container-fluid px-4">
			<div class="row justify-content-center mt-5">
				<div class="col-md-12 heading-section text-center ftco-animate mb-5 mt-5">
					<span class="subheading">Cosa offriamo</span>
					<h2 class="mb-2"><%=voceListaAuto%></h2>
				</div>
			</div>
			<div class="row">
			
<%
        for(Auto a:automobili) { 
        	Integer idAutoCorrente = a.getIdAuto();
        	Double prezzoPerGiornoCorrente = a.getPrezzoPerGiorno();
        	String marcaAutoCorrente = a.getMarca();
        	String modelloAutoCorrente = a.getModello();
        	String urlAutoCorrente = a.getUrlImg();
        	String imgUrl = "/Nolejava/images/auto/";
        	imgUrl += urlAutoCorrente;
        	
%>
				<div class="col-md-3">
				<!-- inizio auto -->
				<form action="/Nolejava/autoServlet" method="POST">
					<input type="hidden" name="idautobtn" value="<%=idAutoCorrente%>">
						<div class="car-wrap ftco-animate">
							<div class="img d-flex align-items-end"
								style="background-image: url(<%=imgUrl%>);">

								<div class="price-wrap d-flex">
									<span class="rate">&#8364; <%=prezzoPerGiornoCorrente%></span>
									<p class="from-day">
										<span>Al</span> <span>/Giorno</span>
									</p>
								</div>
							</div>
							<div class="text p-4 text-center">
								<h2 class="mb-0">
									<a href="#"><%=modelloAutoCorrente%></a>
								</h2>
								<span><%=marcaAutoCorrente%></span>
								<p class="d-flex mb-0 justify-content-center">
									<input type="submit" class="btn btn-black btn-outline-black" value="<%=operazione%>">
								</p>
							</div>
						</div>
				</form>
				</div>
				
				<!--fine auto-->
<%
	}
	%>
			</div>		

				<div class="col-md-12 align-items-center">
					<div class="row mt-5 mb-5">
						<div class="col text-center">
							<div class="block-27">
								<ul id="pagin">
									<li><a class="current" href="#lista-auto">1</a></li>
<% 
									int autoPerPagina = 0;
									if (automobili.size()%4==0){
										autoPerPagina = (int) Math.abs(automobili.size()/4);
									}
									else {
										autoPerPagina = (int) Math.abs(automobili.size()/4);
										autoPerPagina = autoPerPagina+1;
									}
									
									for (int i=2; i<=autoPerPagina;i++) { 
%>
										<li><a href="#lista-auto"><%=i%></a></li>
<%
									}
%>										
									
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- FINE le nostre auto-->
	<!-- INIZIO come funziona-->
	<section class="ftco-section services-section img"
		style="background-image: url(/Nolejava/images/bg_2.jpg);">
		<div class="overlay"></div>
		<div class="container">
			<div class="row justify-content-center mb-5">
				<div
					class="col-md-7 text-center heading-section heading-section-white ftco-animate">
					<span class="subheading">NoleJava</span>
					<h2 class="mb-3">Come funziona</h2>
				</div>
			</div>
			<div class="row">
				<div
					class="col-md-3 d-flex align-self-stretch ftco-animate justify-content-center">
					<div class="media block-6 services services-2">
						<div class="media-body py-md-4 text-center">
							<div
								class="icon d-flex align-items-center justify-content-center">
								<span class="flaticon-route"></span>
							</div>
							<h3>Scegli le date</h3>
							<p>Scegli la durata del tuo noleggio</p>
						</div>
					</div>
				</div>
				<div
					class="col-md-3 d-flex align-self-stretch ftco-animate justify-content-center">
					<div class="media block-6 services services-2">
						<div class="media-body py-md-4 text-center">
							<div
								class="icon d-flex align-items-center justify-content-center">
								<span class="flaticon-select"></span>
							</div>
							<h3>Seleziona l'auto</h3>
							<p>Seleziona la tua auto fra quelle disponibili</p>
						</div>
					</div>
				</div>
				<div
					class="col-md-3 d-flex align-self-stretch ftco-animate justify-content-center">
					<div class="media block-6 services services-2">
						<div class="media-body py-md-4 text-center">
							<div
								class="icon d-flex align-items-center justify-content-center">
								<span class="flaticon-rent"></span>
							</div>
							<h3>Prenota</h3>
							<p>Inserisci i tuoi dati e concludi la prenotazione</p>
						</div>
					</div>
				</div>
				<div
					class="col-md-3 d-flex align-self-stretch ftco-animate justify-content-center">
					<div class="media block-6 services services-2">
						<div class="media-body py-md-4 text-center">
							<div
								class="icon d-flex align-items-center justify-content-center">
								<span class="flaticon-review"></span>
							</div>
							<h3>Ritira e goditi il viaggio</h3>
							<p>Ritira l'auto presso la nostra sede</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- FINE come funziona-->
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
	<%@ include file="footer.jsp" %>  
	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
            <circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
            <circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" />
         </svg>
	</div>
	<div style="display:none">
		<a href="/Nolejava/jsp/homepage.jsp#lista-auto" id="listaref"></a>
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
	<script type="text/javascript" src="/Nolejava/js/datanoleggio.js"></script>
<% 
	String formCompilato = request.getParameter("formcompilato");
	boolean checkForm = formCompilato!=null && !formCompilato.isEmpty();
	if (checkForm){
%>
    <script type="text/javascript" src="/Nolejava/js/specificdiv.js"></script>
<%
	}
%>    
	<script>
		var numeroAuto = <%=automobili.size()%>;
		var numeroPagine = Math.ceil(numeroAuto/4);
	</script>
	<script	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="/Nolejava/js/google-map.js"></script>
	<script src="/Nolejava/js/main.js"></script>
	<script src="/Nolejava/js/script.js"></script>
</body>
</html>