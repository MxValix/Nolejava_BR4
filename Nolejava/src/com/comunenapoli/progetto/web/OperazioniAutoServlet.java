package com.comunenapoli.progetto.web;

import java.io.IOException;
import java.time.LocalDateTime;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comunenapoli.progetto.businessLogic.BusinessLogicAuto;
import com.comunenapoli.progetto.model.Auto;
import com.comunenapoli.progetto.utils.Costanti;


@WebServlet("/operazioniAutoServlet")
public class OperazioniAutoServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		response.setHeader("Last-modified", LocalDateTime.now().toString());
		response.setHeader("Cache-control", "no-store");
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		response.setHeader("Last-modified", LocalDateTime.now().toString());
		response.setHeader("Cache-control", "no-store");
		BusinessLogicAuto businessLogicAuto = (BusinessLogicAuto) getServletContext().getAttribute(Costanti.BUSINESS_LOGIC_AUTO);
		String idAutoString = request.getParameter("idAuto");
		String modello = request.getParameter("modello");
		String marca = request.getParameter("marca");
		String cilindrataString = request.getParameter("cilindrata");
		String numeroPostiString = request.getParameter("numeroposti");
		String tipoCarburante = request.getParameter("tipocarburante");
		String tipologiaAuto = request.getParameter("tipologiaauto");
		String cambio = request.getParameter("cambio");
		String colore = request.getParameter("colore");
		String targa = request.getParameter("targa");
		String prezzoPerGiornoString = request.getParameter("prezzopergiorno");
		String urlImg = request.getParameter("imgurl");
		String action = request.getParameter("action").toLowerCase();
		String html = "";

		Double cilindrata = Double.parseDouble(cilindrataString);
		Integer numeroPosti = Integer.parseInt(numeroPostiString);
		Double prezzoPerGiorno = Double.parseDouble(prezzoPerGiornoString);
		marca = marca.toLowerCase();
		modello = modello.toLowerCase();
		tipologiaAuto = tipologiaAuto.toLowerCase();

		boolean isHiddenEmpty = action==null || action.isEmpty() || action.equals("");
		if (action.contains("aggiungi")) {
			Auto auto = new Auto(tipologiaAuto,marca, modello, cambio, cilindrata,colore, numeroPosti, 
					targa, tipoCarburante, prezzoPerGiorno, urlImg);
			businessLogicAuto.create(auto);			
			html = "/jsp/private/gestisciauto.jsp";
		}
		else if (action.contains("modifica") && idAutoString!=null && !idAutoString.isEmpty()) {
			Integer idAuto = Integer.parseInt(idAutoString);
			Auto auto = businessLogicAuto.getAutoByIdAuto(idAuto);
			Auto autoCorrente = new Auto(tipologiaAuto,marca, modello, cambio, cilindrata,colore, numeroPosti, 
					targa, tipoCarburante, prezzoPerGiorno, urlImg);
			businessLogicAuto.updateAuto(auto,autoCorrente);
			html = "/jsp/private/gestisciauto.jsp";
		}

		RequestDispatcher requestDispatcher; 
		requestDispatcher = request.getRequestDispatcher(html);
		requestDispatcher.forward(request, response);

	}

}

