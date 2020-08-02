<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="com.comunenapoli.progetto.model.Noleggio"%>
<%@page import="java.util.List"%>
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
     List<Noleggio> listaPrenotazioni = (List<Noleggio>) request.getSession().getAttribute(Costanti.NOLEGGI_UTENTE);
%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>NoleJava - Le tue prenotazioni</title>
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
<link rel="stylesheet" href="/Nolejava/css/my-style.css">
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

							<thead class="text-center">

								<th>Prenotazione</th>
								<th>Data prenotazione</th>
								<th>Data inizio noleggio</th>
								<th>Data fine noleggio</th>
								<th>Marca auto</th>
								<th>Modello auto</th>
								<th>Operazione</th>

							</thead>
							<tbody>

								<% 
    for (int i=0; i<listaPrenotazioni.size();i++){
        Noleggio noleggioCorrente = listaPrenotazioni.get(i);
        Integer idNoleggio = noleggioCorrente.getIdNoleggio();
        Date dataPrenotazioneNoleggio = noleggioCorrente.getDataPrenotazione();
        Date dataInizioNoleggio = noleggioCorrente.getDataInizio();
        Date dataFineNoleggio = noleggioCorrente.getDataFine();
        DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
        String dataPrenotazione = df.format(dataPrenotazioneNoleggio);
        String dataInizio = df.format(dataInizioNoleggio);
        String dataFine = df.format(dataFineNoleggio);
        String marca = noleggioCorrente.getAuto().getMarca();
        String modello = noleggioCorrente.getAuto().getModello();
        String targa = noleggioCorrente.getAuto().getTarga();
        String prenotazione = targa + dataPrenotazione.replaceAll("/", "");
        System.out.println("prenotazione: " + prenotazione);
        String operazione = "Cancella noleggio";
%>

								<tr>
									<td><%=prenotazione%></td>
									<td><%=dataPrenotazione%></td>
									<td><%=dataInizio%></td>
									<td><%=dataFine%></td>
									<td><%=marca%></td>
									<td><%=modello%></td>

									<td>
										<form action="/Nolejava/prenotazioniClienteServlet"
											method="POST" id="formCancella">
											<input type="hidden" name="idnoleggio"
												value="<%=idNoleggio%>"> <input type="hidden"
												name="recipient" value="<%=utente.getUsername()%>">
											<p data-placement="top" data-toggle="tooltip" title="Delete" class="my-0 justify-content-center text-center">
												<input value="Cancella noleggio" name="action" type="hidden" value="Cancella noleggio">
												<button id="cancellanoleggio" class="btn btn-danger btn-xs"
													data-title="Cancella noleggio" data-toggle="modal"
													data-target="#delete"
													value="Cancella noleggio" type="button">
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



		<div class="modal fade" id="delete" tabindex="-1" role="dialog"
			aria-labelledby="edit" aria-hidden="true">
			<div class="modal-dialog" style="width:87%">
				<div class="modal-content">
					<div class="modal-header text-center d-block">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">
							<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
						</button>
						<h4 class="modal-title text-center justify-content-center" id="Heading">Elimina la
							tua prenotazione</h4>
					</div>
					<div class="modal-body">

						<div class="alert alert-danger">
							<span class="glyphicon glyphicon-warning-sign"></span> Sei sicuro
							di voler cancellare la tua prenotazione?
						</div>

					</div>
					<div class="modal-footer ">
						<button type="button" id="conferma" class="btn btn-success">
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


    	<jsp:include page="/jsp/footer.jsp"></jsp:include>




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
	<script>
	$('#conferma').on('click',function(){
	     $('#formCancella').submit();
	 });
	</script>
</body>

</html>