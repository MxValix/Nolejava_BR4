<%@page import="com.comunenapoli.progetto.utils.Costanti"%>
<%@page import="com.comunenapoli.progetto.model.Utente"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Utente user = (Utente) request.getSession().getAttribute(Costanti.USER_IN_SESSION);
%>   
<!DOCTYPE html>
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
							<li class="ftco-animate"><a href="https://twitter.com/Rosa_d_"><span
									class="icon-twitter"></span></a></li>
							<li class="ftco-animate"><a href="https://www.facebook.com/NoleJava-101818208296438/"><span
									class="icon-facebook"></span></a></li>
							<li class="ftco-animate"><a href="https://www.instagram.com/nolejava/"><span
									class="icon-instagram"></span></a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4 ml-md-3">
						<h2 class="ftco-heading-2">Informazioni</h2>
						<ul class="list-unstyled">
							<li><a href="/Nolejava/jsp/about.jsp" class="pb-1 d-block">Chi siamo</a></li>
							<li><a href="/Nolejava/jsp/dovesiamo.jsp" class="py-1 d-block">Dove
									siamo</a></li>
							<li><a href="/Nolejava/jsp/termini.jsp" class="py-1 d-block">Term and Conditions</a></li>
							<li><a href="/Nolejava/jsp/privacy.jsp" class="py-1 d-block">Privacy &amp;
									Cookies Policy</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Recapiti</h2>
						<div class="block-23">
							<ul>
								<li class="mt-2 mb-3"><span class="icon icon-map-marker"></span><span
									class="text">Viale F. Ruffo di Calabria 19, 80144 Napoli
										NA</span></li>
								<li class="mb-1"><a href="/Nolejava/jsp/contact.jsp"><span
										class="icon icon-phone"></span><span class="text">081
											060 8349</span></a></li>
								<li><a href="/Nolejava/jsp/contact.jsp"><span
										class="icon icon-envelope"></span><span class="text">info@nolejava.com</span></a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Servizio clienti</h2>
						<ul class="list-unstyled">
							<li><a href="/Nolejava/jsp/contact.jsp" class="pb-1 d-block">Contattaci</a></li>
<%
							if (user==null) {
%>							
								<li><a href="/Nolejava/jsp/registrazione.jsp?user=staff" class="py-1 d-block">Registrazione staff</a></li>
<%
							}
%>							
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