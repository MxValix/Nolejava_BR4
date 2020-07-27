<%@page import="com.comunenapoli.progetto.utils.Costanti"%>
<%@page import="com.comunenapoli.progetto.model.Utente"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
Integer numeroUtentiNonVerificati = (Integer) request.getAttribute(Costanti.NUMERO_UTENTI_NON_VERIFICATI);
Integer numeroNoleggi  = (Integer) request.getAttribute(Costanti.NUMERO_NOLEGGI);
Integer numeroUtenti  = (Integer) request.getAttribute(Costanti.NUMERO_UTENTI);
Integer numeroAuto = (Integer) request.getAttribute(Costanti.NUMERO_AUTO);

String dashboard = "DASHBOARD ";
Utente utente = (Utente) request.getSession().getAttribute(Costanti.USER_IN_SESSION);
if (utente.getRuolo().getId() == Costanti.ID_RUOLO_ADMIN){
	dashboard += "ADMIN";
}else{
	dashboard += "STAFF";
}


%>

<html>

<head>
<meta charset="UTF-8">
<title>Dashboard</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900"
	rel="stylesheet">

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css"
	rel="stylesheet">

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
				<li class="active"><a href="/Nolejava/notificheDashboard">Dashboard</a></li>
				<li><a href="/Nolejava">Homepage</a></li>
				<li>
					<form action="/Nolejava/logoutServlet" method="post">
						<input id="logout" type="submit" value="Logout">
					</form>
				</li>
			</ul>

			<div class="footer">
				<p>
					Copyright ©
					<script>document.write(new Date().getFullYear());</script>
				<p>All rights reserved | NoleJava</p>
				</p>
			</div>

		</div>
	</nav>
	<!-- FINE sidebar -->


	<!-- Page Content  p-4 p-md-5-->
	<div id="content" class="p-4 p-md-3">

		<!-- INIZIO NAVBAR -->
		<nav id="navbar" style="min-height: 60px; border-radius: 0.25rem;"
			class="navbar navbar-expand-lg navbar-light sticky">

			<div class="container-fluid ">
				<p id="paragrafo-dashboard" style="margin-right: auto !important;">
					<%=dashboard%></p>


				<!-- INIZIO NAVBAR-MOBILE -->
				<div id="navbar-mobile">


					<p style="margin-left: auto !important; margin-right: 0 !important">
						<%=dashboard%></p>



					<button class="btn btn-primary d-inline-block d-lg-none ml-auto"
						type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<i class="fa fa-bars"></i>
					</button>

					<img class="d-inline-block d-lg-none ml-auto"
						src="/Nolejava/images/nolejava-vector.svg" alt=""
						style="float: right !important; margin-left: 100px !important; width: 40%; height: 40px !important;">

					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="nav navbar-nav">
							<li class="nav-item active"><a class="nav-link" href="/Nolejava/notificheDashboard">Dashboard</a>
							</li>
							<li class="nav-item"><a class="nav-link"
								href="/Nolejava">Homepage</a></li>
							<li class="nav-item">
								<form action="/Nolejava/logoutServlet" method="post">
									<input id="logout" type="submit" value="Logout">
								</form>
							</li>
						</ul>
					</div>



				</div>
				<!-- FINE NAVBAR-MOBILE -->

				<button type="button" id="sidebarCollapse"
					class="ml-auto btn btn-primary">
					<i class="fa fa-bars"></i> <span class="sr-only">Toggle Menu</span>
				</button>

			</div>
		</nav>
		<!-- FINE NAVBAR -->
		<%
		Integer ruoloUtente = utente.getRuolo().getId();
	%>
		<form action="/Nolejava/dashboardServlet" method="post">
			<div class="container-fluid ">
				<div class="row">
					<% 
			if (ruoloUtente==Costanti.ID_RUOLO_ADMIN) {
	%>
					<div class="col-md-4 col-xl-4">
						<div class="card order-card"
							style="background-color: rgb(36, 37, 38); height: 300px;">
							<div class="notifica card bg-c-yellow order-card fixed-top"
								style="position: absolute; margin: 7%;">
								<div class="card-block">
									<h6 class="m-b-20">Utenti da verificare</h6>
									<h3 class="text-right " style="color: white;">
										<i class="fa fa-user-plus f-left"></i><span><%=numeroUtentiNonVerificati%></span>
									</h3>
								</div>
							</div>
							<div style="display: flex; justify-content: center;">
								<input class="btn btn-primary btn-sm fixed-bottom"
									style="position: absolute; margin-bottom: 10%; margin-right: auto; margin-left: auto; border-radius: 9px;"
									type="submit" name="action" value="Verifica utente">
							</div>
						</div>
					</div>

					<div class="col-md-4 col-xl-4 mt-5 mt-md-0 mt-xl-0">
						<div class="card order-card"
							style="background-color: rgb(36, 37, 38); height: 300px;">
							<div class="notifica card bg-c-yellow order-card fixed-top"
								style="position: absolute; margin: 7%;">
								<div class="card-block">
									<h6 class="m-b-20">Numero totale noleggi</h6>
									<h3 class="text-right " style="color: white;">
										<i class="fas fa-file-invoice-dollar f-left"></i><span><%=numeroNoleggi%></span>
									</h3>
								</div>
							</div>
							<div style="display: flex; justify-content: center;">
								<input class="btn btn-primary btn-sm fixed-bottom"
									style="position: absolute; margin-bottom: 10%; margin-right: auto; margin-left: auto; border-radius: 9px;"
									type="submit" name="action" value="Gestisci noleggi">
							</div>
						</div>
					</div>

					<div class="col-md-4 col-xl-4 mt-5 mt-md-0 mt-xl-0">
						<div class="card order-card"
							style="background-color: rgb(36, 37, 38); height: 300px;">
							<div class="notifica card bg-c-yellow order-card fixed-top"
								style="position: absolute; margin: 7%;">
								<div class="card-block">
									<h6 class="m-b-20">Calendario</h6>
									<h3 class="text-right " style="color: white;">
										<i class="far fa-calendar-alt f-left"></i><span> <script>var today = new Date();
                          var dd = String(today.getDate()).padStart(2, '0');
                          var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!

                          today = dd + '/' + mm ;
                          document.write(today);</script></span>
									</h3>
								</div>
							</div>
							<div style="display: flex; text-align: center;">
								<input class="btn btn-primary btn-sm fixed-bottom"
									style="position: absolute; margin-bottom: 10%; margin-right: auto; margin-left: auto; border-radius: 9px;"
									type="submit" name="action" value="Calendario ferie">
							</div>
						</div>
					</div>

					<% 
			}
	%>
					<div class="col-md-4 col-xl-4 col-xl-offset-2 col-md-offset-2 mt-5">
						<div class="card order-card"
							style="background-color: rgb(36, 37, 38); height: 300px;">
							<div class="notifica card bg-c-yellow order-card fixed-top"
								style="position: absolute; margin: 7%;">
								<div class="card-block">
									<h6 class="m-b-20">Numero utenti registrati</h6>
									<h3 class="text-right " style="color: white;">
										<i class="fa fa-users f-left"></i><span><%=numeroUtenti%></span>
									</h3>
								</div>
							</div>
							<div style="display: flex; justify-content: center;">
								<input class="btn btn-primary btn-sm fixed-bottom"
									style="position: absolute; margin-bottom: 10%; margin-right: auto; margin-left: auto; border-radius: 9px;"
									type="submit" name="action" value="Gestisci utenti">
							</div>
						</div>
					</div>

					<div class="col-md-4 col-xl-4 col-xl-offset-2 col-md-offset-2 mt-5 mb-5 mb-md-5 mb-xl-0">
						<div class="card order-card"
							style="background-color: rgb(36, 37, 38); height: 300px;">
							<div class="notifica card bg-c-yellow order-card fixed-top"
								style="position: absolute; margin: 7%;">
								<div class="card-block">
									<h6 class="m-b-20">Numero totale auto</h6>
									<h3 class="text-right " style="color: white;">
										<i class="fa fa-car f-left"></i><span><%=numeroAuto%></span>
									</h3>
								</div>
							</div>
							<div style="display: flex; justify-content: center;">
								<input class="btn btn-primary btn-sm fixed-bottom"
									style="position: absolute; margin-bottom: 10%; margin-right: auto; margin-left: auto; border-radius: 9px;"
									type="submit" name="action" value="Gestisci auto">
							</div>
						</div>
					</div>



				</div>


			</div>
		</form>
		<!------- FINE CARDS-------->

		<!------- INIZIO footer-------->
		<footer id="footer"
			style="height: 50px; background-color: rgb(36, 37, 38); border-radius: 0.25rem;">
			<div class="footer" style="text-align: center">
				<p>
					Copyright ©
					<script>document.write(new Date().getFullYear());</script>
					All rights reserved | NoleJava
				</p>
			</div>
		</footer>
		<!------- FINE footer-------->


	</div>
  </div>





	<script src="/Nolejava/js/jquery.min.js"></script>
	<script src="/Nolejava/js/popper.js"></script>
	<script src="/Nolejava/js/bootstrap.min.js"></script>
	<script src="/Nolejava/js/main-dashboard.js"></script>

</body>
</html>