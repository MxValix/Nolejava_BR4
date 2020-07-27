<%@page import="com.comunenapoli.progetto.model.Utente"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.comunenapoli.progetto.utils.DataUtils"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="com.comunenapoli.progetto.model.Auto"%>
<%@page import="com.comunenapoli.progetto.utils.Costanti"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	Utente utente = (Utente) request.getSession().getAttribute(Costanti.USER_IN_SESSION);
	Auto auto = (Auto)request.getSession().getAttribute(Costanti.AUTO_IN_SESSION); 
	Date dataInizioNoleggio = (Date) request.getSession().getAttribute(Costanti.DATA_INIZIO_NOLEGGIO);
	Date dataFineNoleggio = (Date) request.getSession().getAttribute(Costanti.DATA_FINE_NOLEGGIO);
	String tipologiaAuto = auto.getTipologiaAuto();
	String marcaAuto = auto.getMarca();
	String modelloAuto = auto.getModello();
	String cambioAuto =  auto.getCambio();
	String carburanteAuto = auto.getTipoCarburante();
	Integer numeroPosti = auto.getNumeroPosti();
	String tipoCarburante = auto.getTipoCarburante();
	String urlAuto = auto.getUrlImg();
	String imgUrl = "/Nolejava/images/auto/";
	imgUrl += urlAuto;
	Double prezzoPerGiorno = auto.getPrezzoPerGiorno();
	Integer totGiorni = 0;
	String dataInizio = "";
	String dataFine = "";
	if (dataInizioNoleggio!=null && dataFineNoleggio!=null){
		totGiorni = DataUtils.getDifferenzaGiorni(dataInizioNoleggio, dataFineNoleggio);
		DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		dataInizio = df.format(dataInizioNoleggio);
		dataFine = df.format(dataFineNoleggio);
	}
	Double prezzo = prezzoPerGiorno * totGiorni;
	String coloreAuto = auto.getColore();
	Double cilindrataAuto = auto.getCilindrata();
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
	       link1 += "profilocliente.jsp";   	
	    } else {
	    	 voce1 = "Dashboard";
	         link1 = "/Nolejava/notificheDashboard";
	    }
	 }	
	
%>   
<!DOCTYPE html>
	<link rel="icon" type="image/png" href="/Nolejava/images/favicon.png"/>

<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
	<symbol id="sym-motor" viewBox="0 0 64 64">
		<title>sym-motor</title>
		<path
			d="m59 21h-2a1 1 0 0 0 -1 1v9h-2v-10a3.009 3.009 0 0 0 -3-3h-6v-4h10a1 1 0 0 0 1-1v-2a5 5 0 0 0 -5-5h-20a5 5 0 0 0 -5 5v2a1 1 0 0 0 1 1h10v4h-7.9a.944.944 0 0 0 -.57.18l-9.84 6.82h-5.69a3.009 3.009 0 0 0 -3 3v13h-2v-9a1 1 0 0 0 -1-1h-2a3.009 3.009 0 0 0 -3 3v20a3.009 3.009 0 0 0 3 3h2a1 1 0 0 0 1-1v-9h2v8a3.009 3.009 0 0 0 3 3h27.7a3.006 3.006 0 0 0 2.74-1.78l3.21-7.22h6.35a1 1 0 0 0 1-1v-11h2v9a1 1 0 0 0 1 1h2a3.009 3.009 0 0 0 3-3v-20a3.009 3.009 0 0 0 -3-3zm-53 34h-1a1 1 0 0 1 -1-1v-20a1 1 0 0 1 1-1h1zm4-10h-2v-2h2zm18-33v-1a3.009 3.009 0 0 1 3-3h20a3.009 3.009 0 0 1 3 3v1zm15 2v4h-4v-4zm9 33h-6a.987.987 0 0 0 -.91.59l-3.48 7.82a1 1 0 0 1 -.91.59h-27.7a1 1 0 0 1 -1-1v-27a1 1 0 0 1 1-1h6a.988.988 0 0 0 .57-.18l9.84-6.82h21.59a1 1 0 0 1 1 1zm4-12h-2v-2h2zm4 9a1 1 0 0 1 -1 1h-1v-22h1a1 1 0 0 1 1 1z" />
		<path d="m27 35a5 5 0 1 0 5 5 5.006 5.006 0 0 0 -5-5zm0 8a3 3 0 1 1 3-3 3 3 0 0 1 -3 3z" />
		<path
			d="m47.12 33.11-2.4-.31 1.49-1.91a1.006 1.006 0 0 0 -.08-1.32l-2.7-2.7a1.006 1.006 0 0 0 -1.32-.08l-1.91 1.49-.31-2.4a1 1 0 0 0 -.99-.88h-3.8a1 1 0 0 0 -.99.88l-.31 2.4-1.91-1.49a1.006 1.006 0 0 0 -1.32.08l-2.12 2.13h-3.35a1 1 0 0 0 -.99.88l-.31 2.4-1.91-1.49a1.006 1.006 0 0 0 -1.32.08l-2.7 2.7a1.006 1.006 0 0 0 -.08 1.32l1.49 1.91-2.4.31a1 1 0 0 0 -.88.99v3.8a1 1 0 0 0 .88.99l2.4.31-1.49 1.9a1.019 1.019 0 0 0 .08 1.33l2.7 2.7a1.006 1.006 0 0 0 1.32.08l1.91-1.49.31 2.4a1 1 0 0 0 .99.88h3.8a1 1 0 0 0 .99-.88l.31-2.4 1.91 1.49a1.006 1.006 0 0 0 1.32-.08l2.12-2.13h3.35a1 1 0 0 0 .99-.88l.31-2.4 1.91 1.49a1.006 1.006 0 0 0 1.32-.08l2.7-2.7a1.006 1.006 0 0 0 .08-1.32l-1.49-1.91 2.4-.31a1 1 0 0 0 .88-.99v-3.8a1 1 0 0 0 -.88-.99zm-14.48 13.98-1.89-1.47a.98.98 0 0 0 -1.04-.11 4.26 4.26 0 0 1 -.7.28 1.019 1.019 0 0 0 -.69.83l-.3 2.38h-2.04l-.3-2.38a1.019 1.019 0 0 0 -.69-.83 4.26 4.26 0 0 1 -.7-.28.98.98 0 0 0 -1.04.11l-1.89 1.47-1.45-1.45 1.47-1.89a.98.98 0 0 0 .11-1.04 4.26 4.26 0 0 1 -.28-.7 1.019 1.019 0 0 0 -.83-.69l-2.38-.3v-2.04l2.38-.3a1.019 1.019 0 0 0 .83-.69 4.26 4.26 0 0 1 .28-.7.98.98 0 0 0 -.11-1.04l-1.47-1.89 1.45-1.45 1.89 1.47a.98.98 0 0 0 1.04.11 4.26 4.26 0 0 1 .7-.28 1.019 1.019 0 0 0 .69-.83l.3-2.38h2.01l.33 2.39a1.006 1.006 0 0 0 .69.82 4.26 4.26 0 0 1 .7.28.981.981 0 0 0 1.05-.12l1.88-1.46 1.45 1.45-1.47 1.89a.98.98 0 0 0 -.11 1.04 4.26 4.26 0 0 1 .28.7 1.019 1.019 0 0 0 .83.69l2.38.3v2.04l-2.38.3a1.094 1.094 0 0 0 -.84.73l-.05.16c-.07.18-.15.34-.22.5a.98.98 0 0 0 .11 1.04l1.47 1.89zm3.49-13.52-.32-.32a2.994 2.994 0 1 1 2.19 5.57v-.72a1 1 0 0 0 -.88-.99l-2.4-.31 1.49-1.91a1.006 1.006 0 0 0 -.08-1.32zm9.87 3.45-2.38.3a1.019 1.019 0 0 0 -.83.69 4.26 4.26 0 0 1 -.28.7.98.98 0 0 0 .11 1.04l1.47 1.89-1.45 1.45-1.89-1.47a1 1 0 0 0 -1.04-.11 4.26 4.26 0 0 1 -.7.28 1.019 1.019 0 0 0 -.69.83l-.3 2.38h-1.89l-1.41-1.8 2.4-.31a1 1 0 0 0 .88-.99v-1a5 5 0 1 0 -3.67-9.13l-.9-.9a1.006 1.006 0 0 0 -1.32-.08l-1.92 1.49-.27-1.92 1.44-1.45 1.89 1.47a.982.982 0 0 0 1.04.11 4.26 4.26 0 0 1 .7-.28 1.019 1.019 0 0 0 .69-.83l.3-2.38h2.04l.3 2.38a1.019 1.019 0 0 0 .69.83 4.26 4.26 0 0 1 .7.28.98.98 0 0 0 1.04-.11l1.89-1.47 1.45 1.45-1.47 1.89a.98.98 0 0 0 -.11 1.04 4.26 4.26 0 0 1 .28.7 1.019 1.019 0 0 0 .83.69l2.38.3z" />
		<path d="m48 22h2v2h-2z" />
		<path d="m44 22h2v2h-2z" />
		<path d="m14 52h2v2h-2z" />
		<path d="m18 52h2v2h-2z" />
	</symbol>
	<symbol id="euro" viewBox="0 0 512 512">
		<title>euro</title>
		<path
			d="m256 512c-68.38 0-132.668-26.628-181.02-74.98s-74.98-112.64-74.98-181.02 26.629-132.667 74.98-181.02 112.64-74.98 181.02-74.98 132.668 26.628 181.02 74.98 74.98 112.64 74.98 181.02-26.629 132.667-74.98 181.02-112.64 74.98-181.02 74.98zm0-480c-123.514 0-224 100.486-224 224s100.486 224 224 224 224-100.486 224-224-100.486-224-224-224z" />
		<path
			d="m320 360h-32c-36.743 0-69.097-19.153-87.602-48h71.602c8.837 0 16-7.164 16-16s-7.163-16-16-16h-85.2c-1.828-7.707-2.8-15.742-2.8-24s.973-16.293 2.8-24h85.2c8.837 0 16-7.164 16-16s-7.163-16-16-16h-71.602c18.505-28.847 50.859-48 87.602-48h24c8.837 0 16-7.164 16-16s-7.163-16-16-16h-24c-55.039 0-102.545 32.865-123.929 80h-20.071c-8.837 0-16 7.164-16 16s7.163 16 16 16h10.121c-1.393 7.793-2.121 15.813-2.121 24s.728 16.207 2.121 24h-10.121c-8.837 0-16 7.164-16 16s7.163 16 16 16h20.071c21.383 47.135 68.89 80 123.929 80h32c8.837 0 16-7.164 16-16s-7.163-16-16-16z" />
	</symbol>
	<symbol id="bill" viewBox="0 0 480 480">
		<title>bill</title>
		<path
			d="m215 164c0 57.897 47.103 105 105 105s105-47.103 105-105-47.103-105-105-105-105 47.103-105 105zm194 0c0 49.075-39.925 89-89 89s-89-39.925-89-89 39.925-89 89-89 89 39.925 89 89zm-89-54c4.418 0 8 3.582 8 8v3.376c9.311 3.303 16 12.195 16 22.624 0 4.418-3.582 8-8 8s-8-3.582-8-8c0-4.411-3.589-8-8-8s-8 3.589-8 8v3.237c0 3.518 2.256 6.586 5.614 7.636l9.544 2.982c10.074 3.149 16.842 12.355 16.842 22.908v3.237c0 11.519-8.159 21.166-19 23.473v2.527c0 4.418-3.582 8-8 8s-8-3.582-8-8v-4.68c-7.714-3.996-13-12.05-13-21.32 0-4.418 3.582-8 8-8s8 3.582 8 8c0 4.411 3.589 8 8 8s8-3.589 8-8v-3.237c0-3.518-2.256-6.586-5.614-7.636l-9.544-2.982c-10.074-3.149-16.842-12.355-16.842-22.908v-3.237c0-10.429 6.689-19.321 16-22.624v-3.376c0-4.418 3.582-8 8-8zm130 212v102c0 30.879-25.122 56-56 56h-308c-30.878 0-56-25.121-56-56v-392c0-17.645 14.355-32 32-32h260c17.645 0 32 14.355 32 32 0 4.418-3.582 8-8 8s-8-3.582-8-8c0-8.822-7.178-16-16-16h-260c-8.822 0-16 7.178-16 16v392c0 22.056 17.944 40 40 40h268.862c-10.395-10.172-16.862-24.342-16.862-40v-125c0-4.418 3.582-8 8-8s8 3.582 8 8v125c0 22.056 17.944 40 40 40s40-17.944 40-40v-102c0-8.822-7.178-16-16-16h-34c-4.418 0-8-3.582-8-8s3.582-8 8-8h34c17.645 0 32 14.355 32 32zm-350-107c0-4.418 3.582-8 8-8h68c4.418 0 8 3.582 8 8s-3.582 8-8 8h-68c-4.418 0-8-3.582-8-8zm0-90c0-4.418 3.582-8 8-8h68c4.418 0 8 3.582 8 8s-3.582 8-8 8h-68c-4.418 0-8-3.582-8-8zm184 180c0 4.418-3.582 8-8 8h-168c-4.418 0-8-3.582-8-8s3.582-8 8-8h168c4.418 0 8 3.582 8 8zm0 84c0 4.418-3.582 8-8 8h-168c-4.418 0-8-3.582-8-8s3.582-8 8-8h168c4.418 0 8 3.582 8 8z" />
	</symbol>
	<symbol id="color-palette" viewBox="0 0 510.748 510.748">
		<title>color-palette</title>
		<path
			d="m448.914 206.73-27.603-30.529c5.365-9.065 7.28-19.631 5.372-30.096-2.098-11.507-8.552-21.509-18.172-28.163l-39.826-27.544c.251-6.43-.931-12.888-3.547-18.974-4.62-10.746-13.147-19.05-24.014-23.383l-88.073-35.116c-10.675-4.256-22.306-4.141-32.75.146-7.946-8.062-18.983-13.071-31.171-13.071h-94.815c-24.147 0-43.792 19.645-43.792 43.792v375.757c0 50.288 40.912 91.199 91.199 91.199 22.885 0 43.826-8.475 59.855-22.448.23-.164.455-.338.67-.531l170.744-153.661c3.078-2.771 3.328-7.513.558-10.592-2.772-3.08-7.517-3.329-10.592-.558l-7.034 6.331-22.855-25.277 35.882-51.883 32.621 36.078-14.842 13.358c-3.078 2.771-3.328 7.513-.558 10.592 1.481 1.646 3.525 2.483 5.577 2.483 1.788 0 3.582-.635 5.016-1.925l49.037-44.132c8.677-7.845 13.778-18.6 14.366-30.282s-3.408-22.895-11.253-31.571zm-36.988-57.935c1.379 7.565-.271 15.216-4.646 21.541l-20.365 29.447-46.364-32.064 24.546-61.563 34.881 24.124c6.326 4.374 10.569 10.949 11.948 18.515zm-71.287 117.9-31.002-21.441 25.214-63.239 43.531 30.105zm-46.276 66.912-15.641-10.817 25.215-63.24 28.169 19.482zm11.544-119.498-21.736-8.667c-3.846-1.533-8.209.341-9.744 4.189-1.534 3.848.342 8.21 4.189 9.745l21.735 8.666-25.764 64.618-41.665-16.613v-74.89l15.874 6.329c.911.363 1.851.535 2.775.535 2.979 0 5.798-1.788 6.969-4.724 1.534-3.848-.341-8.21-4.188-9.745l-21.43-8.544v-74.89l98.749 39.373zm-87.985-46.809h-84.956c-4.142 0-7.5 3.358-7.5 7.5s3.358 7.5 7.5 7.5h84.956v69.565h-152.399v-69.565h35.48c4.142 0 7.5-3.358 7.5-7.5s-3.358-7.5-7.5-7.5h-35.48v-69.565h152.398v69.565zm-152.399 99.565h152.398v69.565h-152.398zm167.399 25.33 36.11 14.398-36.11 90.566zm46.735 89.047 8.317 9.198-38.873 34.983zm-32.411 20.494 25.777-64.651 12.809 8.858zm.25-374.877 88.073 35.116c7.144 2.848 12.75 8.308 15.787 15.373 2.089 4.857 2.79 10.074 2.099 15.181-.012.059-.018.119-.029.178-.32 2.261-.91 4.5-1.778 6.675l-14.423 36.175-104.303-41.588v-50.177c0-6.378-1.382-12.437-3.844-17.908 6.018-1.701 12.447-1.406 18.418.975zm-153.181-11.859h94.815c15.875 0 28.792 12.916 28.792 28.792v38.944h-152.399v-38.944c0-15.876 12.916-28.792 28.792-28.792zm-28.792 404.549v-68.119h152.398v68.119c0 42.017-34.183 76.199-76.199 76.199s-76.199-34.183-76.199-76.199zm279.25-80.225-45.649 41.081-10.703-11.837 35.882-51.883zm100.413-101.777c-.386 7.681-3.74 14.751-9.433 19.898l-23.032 20.728-35.007-38.717 34.916-50.487 25.156 27.821c5.159 5.705 7.787 13.076 7.4 20.757z" />
		<path
			d="m140.023 383.857c-19.832 0-35.966 16.134-35.966 35.966s16.134 35.966 35.966 35.966 35.966-16.134 35.966-35.966-16.134-35.966-35.966-35.966zm0 56.933c-11.561 0-20.966-9.405-20.966-20.966s9.405-20.966 20.966-20.966 20.966 9.405 20.966 20.966-9.405 20.966-20.966 20.966z" />
	</symbol>
	<symbol id="conveyor" viewBox="0 0 480 480">
		<title>conveyor</title>
		<g>
			<g>
				<path
					d="M472,432h-40v-96h16c4.418,0,8-3.582,8-8v-96c0-4.418-3.582-8-8-8h-80c-4.418,0-8,3.582-8,8v96c0,4.418,3.582,8,8,8h16v96 h-64v-32h16c4.418,0,8-3.582,8-8v-96c0-4.418-3.582-8-8-8h-80c-4.418,0-8,3.582-8,8v96c0,4.418,3.582,8,8,8h16v32h-64v-32h16 c4.418,0,8-3.582,8-8v-96c0-4.418-3.582-8-8-8h-80c-4.418,0-8,3.582-8,8v96c0,4.418,3.582,8,8,8h16v32H96v-96h16 c4.418,0,8-3.582,8-8v-96c0-4.418-3.582-8-8-8H32c-4.418,0-8,3.582-8,8v96c0,4.418,3.582,8,8,8h16v96H8c-4.418,0-8,3.582-8,8v32 c0,4.418,3.582,8,8,8h464c4.418,0,8-3.582,8-8v-32C480,435.582,476.418,432,472,432z M376,240h64v16h-64V240z M376,320v-48h64v48 H376z M416,336v96h-16v-96H416z M264,304h64v16h-64V304z M264,384v-48h64v48H264z M304,400v32h-16v-32H304z M152,304h64v16h-64 V304z M152,384v-48h64v48H152z M192,400v32h-16v-32H192z M40,240h64v16H40V240z M40,320v-48h64v48H40z M80,336v96H64v-96H80z M464,464H16v-16h448V464z" />
			</g>
		</g>
		<g>
			<g>
				<path
					d="M472,0H8C3.582,0,0,3.582,0,8v32c0,4.418,3.582,8,8,8h40v88c0,4.418,3.582,8,8,8h8v48h-8v16h32v-16h-8v-48h8 c4.418,0,8-3.582,8-8V48h64v88c0,4.418,3.582,8,8,8h8v48h-8v16h32v-16h-8v-48h8c4.418,0,8-3.582,8-8V48h64v88c0,4.418,3.582,8,8,8 h8v48h-8v16h32v-16h-8v-48h8c4.418,0,8-3.582,8-8V48h64v88c0,4.418,3.582,8,8,8h8v48h-8v16h32v-16h-8v-48h8c4.418,0,8-3.582,8-8 V48h40c4.418,0,8-3.582,8-8V8C480,3.582,476.418,0,472,0z M80,128H64v-16h16V128z M80,96H64V48h16V96z M192,128h-16v-16h16V128z M192,96h-16V48h16V96z M304,128h-16v-16h16V128z M304,96h-16V48h16V96z M416,128h-16v-16h16V128z M416,96h-16V48h16V96z M464,32 H16V16h448V32z" />
			</g>
		</g>
	</symbol>
	<symbol id="seat-belt" viewBox="0 0 64 64">
		<title>seat-belt</title>
		<path
			d="m25.965 15h12a1 1 0 0 0 .99-1.142l-1-7a1 1 0 0 0 -.99-.858h-10a1 1 0 0 0 -.99.858l-1 7a1 1 0 0 0 .99 1.142zm1.867-7h8.268l.714 5h-9.696z" />
		<path d="m32 54h2v2h-2z" />
		<path d="m27 21h2v2h-2z" />
		<path d="m31 21h2v2h-2z" />
		<path d="m35 21h2v2h-2z" />
		<path
			d="m47 62a1 1 0 0 0 1-1v-5.837l1.949-5.847a1.9 1.9 0 0 0 .051-.316v-4a3 3 0 0 0 -3-3v-20a5 5 0 0 0 -4.821-4.982 4.379 4.379 0 0 0 .763-3.231l-2-9.183a3.009 3.009 0 0 0 -2.977-2.604h-12a2.985 2.985 0 0 0 -2.96 2.523l-2.031 9.345a4.328 4.328 0 0 0 .78 3.157 4.994 4.994 0 0 0 -4.754 4.975v20a3 3 0 0 0 -3 3v4a1.9 1.9 0 0 0 .051.316l1.949 5.847v5.837a1 1 0 0 0 1 1zm-1-2h-5v-4h5zm1-16a1 1 0 0 1 1 1v3h-5.612l1.333-4zm-2-22v20h-3.009c-.092-9.77-1.5-14.717-1.936-16.02a30.887 30.887 0 0 0 .925-6.98h1.02a3 3 0 0 1 3 3zm-6.75 3h-12.5a30.785 30.785 0 0 1 -.727-6h13.954a30.785 30.785 0 0 1 -.727 6zm.726 5h-13.952a30.052 30.052 0 0 1 .7-3h12.552a29.761 29.761 0 0 1 .7 3zm.326 2c.164 1.145.315 2.474.435 4h-15.474c.12-1.526.271-2.855.435-4zm.566 6c.065 1.227.108 2.56.122 4h-15.98c.014-1.44.057-2.773.122-4zm1.744 6-1.333 4h-16.558l-1.333-4zm-18.67-29.787 2.032-9.345a1 1 0 0 1 .991-.868h12a1.032 1.032 0 0 1 1 .949l2 9.183a2.313 2.313 0 0 1 -.52 1.885 3.27 3.27 0 0 1 -2.48.983h-12a3.271 3.271 0 0 1 -2.489-.982 2.273 2.273 0 0 1 -.534-1.805zm-3.942 7.787a3 3 0 0 1 3-3h1.02a30.845 30.845 0 0 0 .925 6.98c-.438 1.303-1.845 6.241-1.945 16.02h-3zm-3 26v-3a1 1 0 0 1 1-1h3.279l1.333 4zm7 12h-5v-4h5zm-5.279-6-1.334-4h31.226l-1.334 4h-10.279v2h3v4h-14v-4h5v-2z" />
	</symbol>
	<symbol id="fuel" viewBox="0 0 512 512">
		<title>fuel</title>
		<path
			d="m116.18 132.11h166.74a6 6 0 0 0 6-6v-47.81a19.246 19.246 0 0 0 -19.23-19.22h-140.28a19.247 19.247 0 0 0 -19.23 19.22v47.81a6 6 0 0 0 6 6zm6-53.81a7.233 7.233 0 0 1 7.23-7.22h140.28a7.233 7.233 0 0 1 7.23 7.22v41.81h-154.74z" />
		<path d="m113.46 191.97a6 6 0 0 0 -6 6v7.83a6 6 0 0 0 12 0v-7.83a6 6 0 0 0 -6-6z" />
		<path d="m113.46 217.71a6 6 0 0 0 -6 6v117.53a6 6 0 0 0 12 0v-117.53a6 6 0 0 0 -6-6z" />
		<path
			d="m208.333 190.9a6 6 0 0 0 6 6h135.277a8.31 8.31 0 0 1 8.3 8.3v202.29a8.309 8.309 0 0 1 -8.3 8.3h-189.47a8.309 8.309 0 0 1 -8.3-8.3v-202.29a8.31 8.31 0 0 1 8.3-8.3h24.193a6 6 0 0 0 0-12h-24.193a20.322 20.322 0 0 0 -20.3 20.3v202.29a20.322 20.322 0 0 0 20.3 20.3h189.47a20.322 20.322 0 0 0 20.3-20.3v-202.29a20.322 20.322 0 0 0 -20.3-20.3h-135.277a6 6 0 0 0 -6 6z" />
		<path
			d="m249.369 389.325a57.671 57.671 0 0 0 49.789-86.847l-44.61-76.17a6 6 0 0 0 -10.355 0l-44.62 76.17a57.67 57.67 0 0 0 49.8 86.848zm-39.442-80.783 39.442-67.331 39.436 67.333a45.7 45.7 0 0 1 -7.117 55.422 45.709 45.709 0 0 1 -71.76-55.425z" />
		<path
			d="m258.75 358.4a6 6 0 0 0 1.948-.326 34.778 34.778 0 0 0 7.022-3.337 35.31 35.31 0 0 0 6.237-4.96 34.6 34.6 0 0 0 9.5-17.713 6 6 0 0 0 -11.757-2.364 22.632 22.632 0 0 1 -6.221 11.593 23.263 23.263 0 0 1 -4.1 3.262 22.694 22.694 0 0 1 -4.578 2.175 6 6 0 0 0 1.949 11.67z" />
		<path
			d="m443.721 104.692-85.78-41.65a6 6 0 0 0 -8.07 2.887l-11.971 25.984-4.886-2.52v-23.143a50.132 50.132 0 0 0 -50.08-50.07h-167.954a50.132 50.132 0 0 0 -50.08 50.07v379.5a50.132 50.132 0 0 0 50.08 50.07h279.8a50.127 50.127 0 0 0 50.07-50.07v-295a6 6 0 0 0 -3.249-5.332l-7.787-4.017 12.773-28.885a6 6 0 0 0 -2.866-7.824zm-10.871 341.058a38.114 38.114 0 0 1 -38.07 38.07h-279.8a38.118 38.118 0 0 1 -38.08-38.07v-379.5a38.118 38.118 0 0 1 38.08-38.07h167.95a38.118 38.118 0 0 1 38.08 38.07v26.8a6 6 0 0 0 3.25 5.332l108.59 56.024zm-9.718-309.861-74.562-38.47 9.637-20.908 75.064 36.447z" />
	</symbol>
	<symbol id="car" viewBox="0 0 468 468">
		<title>car</title>
		<g>
			<g>
				<path
					d="M450.1,187.5l-10.2-10.8l-35.8-96.5C398,63.9,382.4,53.1,365,53H109.3c-17.4,0-33,10.9-39.1,27.2l-35.3,95.3l-14.7,13.6 C7.4,200,0,216,0,232.8v140.6c0.1,23,18.8,41.6,41.8,41.6h26.4c23,0,41.7-18.6,41.8-41.6V353h248v20.4c0.1,23,18.8,41.6,41.8,41.6 h26.4c23,0,41.7-18.6,41.8-41.6V229.1C467.9,213.4,461.5,198.4,450.1,187.5z M89,87c3.2-8.5,11.3-14,20.3-14h255.8 c9,0,17.1,5.6,20.3,14l31.2,84h-23.3c-5.5-37.5-40.4-63.4-77.9-57.8c-29.9,4.4-53.4,27.9-57.8,57.8H57.8L89,87z M372.9,171h-95.1 c5.5-26.3,31.3-43.1,57.6-37.6C354.2,137.4,368.9,152.1,372.9,171z M90,373.4c-0.1,12-9.8,21.6-21.8,21.6H41.8 c-12,0-21.7-9.6-21.8-21.6v-26.2c6,3.9,13.9,5.8,21.8,5.8H90V373.4z M448,373.4c-0.1,12-9.8,21.6-21.8,21.6h-26.4 c-12,0-21.7-9.7-21.8-21.6V353h48.2c7.9,0,15.8-1.9,21.8-5.8V373.4z M426.2,333H41.8c-11.9,0.1-21.7-9.4-21.8-21.4v-78.8 c0-11,4.9-21.5,13.3-28.6c0.1-0.1,0.3-0.3,0.4-0.4L47.3,191H426l9.6,10.3c0.1,0.2,0.4,0.3,0.5,0.5c7.5,7.1,11.8,17,11.8,27.3v82.5 h0.1C447.9,323.5,438.1,333.1,426.2,333z" />
			</g>
		</g>
		<g>
			<g>
				<path
					d="M132,231H57c-5.5,0-10,4.5-10,10v52c0,5.5,4.5,10,10,10h75c5.5,0,10-4.5,10-10v-52C142,235.5,137.5,231,132,231z M122,283 H67v-32h55V283z" />
			</g>
		</g>
		<g>
			<g>
				<path
					d="M411,231h-75c-5.5,0-10,4.5-10,10v52c0,5.5,4.5,10,10,10h75c5.5,0,10-4.5,10-10v-52C421,235.5,416.5,231,411,231z M401,283h-55v-32h55V283z" />
			</g>
		</g>
		<g>
			<g>
				<path
					d="M282.3,273h-96.6c-5.5,0-10,4.5-10,10s4.5,10,10,10h96.6c5.5,0,10-4.5,10-10S287.8,273,282.3,273z" />
			</g>
		</g>
		<g>
			<g>
				<path
					d="M282.3,242h-96.6c-5.5,0-10,4.5-10,10s4.5,10,10,10h96.6c5.5,0,10-4.5,10-10S287.8,242,282.3,242z" />
			</g>
		</g>
	</symbol>
</svg>
<html lang="en">

<head>
	<title><%=marcaAuto%> <%=modelloAuto%></title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

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
	<section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('/Nolejava/images/bg_2.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
				<div class="col-md-9 ftco-animate pb-5">
					<p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home <i
									class="ion-ios-arrow-forward"></i></a></span> <span>Dettagli Auto<i
								class="ion-ios-arrow-forward"></i></span></p>
					<h1 class="mb-3 bread">Dettagli Auto</h1>
				</div>
			</div>
		</div>
	</section>
	<!-- FINE intestazione -->

	<!-- INIZIO dettagli-auto -->
	<section class="ftco-section ftco-car-details">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-12">
					<div class="car-details">
						<img class="img-fluid mx-auto d-block foto-auto" src="<%=imgUrl%>" style="width: 50%; height:50% ;">
						<div class="text text-center">
							<span class="subheading"><%=marcaAuto%></span>
							<h2><%=modelloAuto%></h2>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-3 col-6 margini">
					<div class="media block-6 services">
						<div class="media-body py-md-4">
							<div class="d-flex mb-3">
								<div class="text justify-content-center">
									<svg class="icon" style="width: 36%; height: 36%; display: block; margin: auto">
										<use xlink:href="#car" /></svg>
									<h3 class="heading mb-0 pl-3;" style="text-align: center;">
										Tipologia
										<span><%=tipologiaAuto%></span>
									</h3>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-3 col-6 margini">
					<div class="media block-6 services">
						<div class="media-body py-md-4">
							<div class="d-flex mb-3">
								<div class="text justify-content-center">
									<svg class="icon" style="width: 36%; height: 36%; display: block; margin: auto">
										<use xlink:href="#euro" /></svg>
									<h3 class="heading mb-0 pl-3;" style="text-align: center;">
										Prezzo per giorno
										<span>&#8364; <%=prezzoPerGiorno%></span>
									</h3>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-3 col-6 margini">
					<div class="media block-6 services">
						<div class="media-body py-md-4">
							<div class="d-flex mb-3">
								<div class="text justify-content-center">
									<svg class="icon" style="width: 36%; height: 36%; display: block; margin: auto">
										<use xlink:href="#bill" /></svg>
									<h3 class="heading mb-0 pl-3;" style="text-align: center;">
										Costo noleggio
										<span>&#8364; <%=prezzo%></span>
									</h3>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-3 col-6 margini">
					<div class="media block-6 services">
						<div class="media-body py-md-4">
							<div class="d-flex mb-3">
								<div class="text justify-content-center">
									<svg class="icon" style="width: 36%; height: 36%; display: block; margin: auto">
										<use xlink:href="#seat-belt" /></svg>
									<h3 class="heading mb-0 pl-3;" style="text-align: center;">
										Numero posti
										<span><%=numeroPosti%></span>
									</h3>
								</div>
							</div>
						</div>
					</div>
				</div>



				<div class="col-md-3 col-6 margini">
					<div class="media block-6 services">
						<div class="media-body py-md-4">
							<div class="d-flex mb-3">
								<div class="text justify-content-center">
									<svg class="icon" style="width: 36%; height: 36%; display: block; margin: auto">
										<use xlink:href="#sym-motor" /></svg>
									<h3 class="heading mb-0 pl-3;" style="text-align: center;">
										Cilindrata
										<span><%=cilindrataAuto%></span>
									</h3>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-3 col-6 margini">
					<div class="media block-6 services">
						<div class="media-body py-md-4">
							<div class="d-flex mb-3">
								<div class="text justify-content-center">
									<svg class="icon" style="width: 36%; height: 36%; display: block; margin: auto">
										<use xlink:href="#conveyor" /></svg>
									<h3 class="heading mb-0 pl-3;" style="text-align: center;">
										Cambio
										<span><%=cambioAuto%></span>
									</h3>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-3 col-6 margini">
					<div class="media block-6 services">
						<div class="media-body py-md-4">
							<div class="d-flex mb-3">
								<div class="text justify-content-center">
									<svg class="icon" style="width: 36%; height: 36%; display: block; margin: auto">
										<use xlink:href="#fuel" /></svg>
									<h3 class="heading mb-0 pl-3;" style="text-align: center;">
										Carburante
										<span><%=tipoCarburante%></span>
									</h3>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-3 col-6 margini">
					<div class="media block-6 services">
						<div class="media-body py-md-4">
							<div class="d-flex mb-3">
								<div class="text justify-content-center">
									<svg class="icon" style="width: 36%; height: 36%; display: block; margin: auto">
										<use xlink:href="#color-palette" /></svg>
									<h3 class="heading mb-0 pl-3;" style="text-align: center;">
										Colore
										<span><%=coloreAuto%></span>
									</h3>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
	<!-- FiNE dettagli-auto -->
<%
	if (utente!=null && dataInizioNoleggio!=null && dataFineNoleggio!=null) {
%>	
	<form action="/Nolejava/noleggioServlet" method="POST" class="p-5 contact-form" style="text-align: center;">
		<div class="form-group">
		  <input type="submit" value="Continua Prenotazione" class="btn btn-primary py-3 px-5">
		</div>
	</form>
<% 
	}
	else if (utente!=null){
%>		
		<div class="text-center justify-content-center">
		  <a href="/Nolejava/jsp/homepage.jsp#filtri" class="btn btn-primary py-3 px-5">Inserisci periodo noleggio</a>
		</div>
<%	}
	else {
%>
		<div class="text-center justify-content-center">
		  <a href="/Nolejava/jsp/login.jsp" class="btn btn-primary py-3 px-5">Accedi per noleggiare</a>
		</div>

<%
	}
%>

	<!-- INIZIO optional-->
			<div class="row">
				<div class="col-md-12 pills">
					<div class="bd-example bd-example-tabs">
						<div class="d-flex justify-content-center">
							<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">

								<li class="nav-item">
									<a class="nav-link active" id="pills-description-tab" data-toggle="pill"
										href="#pills-description" role="tab" aria-controls="pills-description"
										aria-expanded="true">Optional</a>
								</li>
							</ul>
						</div>

						<div class="tab-content" id="pills-tabContent">
							<div class="tab-pane fade show active" id="pills-description" role="tabpanel"
								aria-labelledby="pills-description-tab">
								<div class="row">
									<div class="col-md-4">
										<ul class="features">
											<li class="check"><span class="ion-ios-checkmark"></span>Aria condizionata
											</li>
											<li class="check"><span class="ion-ios-checkmark"></span>Sedile bambino</li>
											<li class="check"><span class="ion-ios-checkmark"></span>GPS</li>
											<li class="check"><span class="ion-ios-checkmark"></span>Stereo</li>
										</ul>
									</div>
									<div class="col-md-4">
										<ul class="features">
											<li class="check"><span class="ion-ios-checkmark"></span>Cinture di sicurezza</li>
											<li class="check"><span class="ion-ios-checkmark"></span>Car Kit</li>											<li class="check"><span class="ion-ios-checkmark"></span>Bluetooth</li>
											<li class="remove"><span class="ion-ios-close"></span>Onboard computer
											</li>
										</ul>
									</div>
									<div class="col-md-4">
										<ul class="features">
											<li class="check"><span class="ion-ios-checkmark"></span>Audio input
											</li>
											<li class="check"><span class="ion-ios-checkmark"></span>Airbags
											</li>
											<li class="check"><span class="ion-ios-checkmark"></span>Antifurto</li>
											<li class="check"><span class="ion-ios-checkmark"></span>Climate control
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- FINE optional-->


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
											class="text">081 060 8349</span></a></li>
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
						<script>document.write(new Date().getFullYear());</script> All rights reserved | NoleJava
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
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="/Nolejava/js/google-map.js"></script>
	<script src="/Nolejava/js/main.js"></script>

</body>

</html>
