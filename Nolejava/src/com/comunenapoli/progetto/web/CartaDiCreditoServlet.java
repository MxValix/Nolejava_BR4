package com.comunenapoli.progetto.web;

import java.io.IOException;
import java.text.ParseException;
import java.time.LocalDateTime;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comunenapoli.progetto.businessLogic.BusinessLogicCarta;
import com.comunenapoli.progetto.model.Utente;
import com.comunenapoli.progetto.utils.Costanti;



@WebServlet("/cartaServlet")
public class CartaDiCreditoServlet extends HttpServlet {

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
		Utente utente = (Utente) request.getSession().getAttribute(Costanti.USER_IN_SESSION);
		BusinessLogicCarta businessLogicCarta = (BusinessLogicCarta) getServletContext().getAttribute(Costanti.BUSINESS_LOGIC_CARTA);
		String dataDiScadenza = request.getParameter("datascadenza");
		String numeroCarta = request.getParameter("numerocarta");
		String cvvString = request.getParameter("cvv");
		String idCartaString = request.getParameter("idCarta");
		Integer cvv = 0;
		Integer idCarta = 0;
		if (cvvString!=null && !cvvString.isEmpty()) cvv = Integer.parseInt(cvvString);
		try {
			businessLogicCarta.operazioniCarta(idCarta, dataDiScadenza, numeroCarta, cvv, utente);
			String html = "";
			Boolean isProfiloCliente = (Boolean)request.getSession().getAttribute(Costanti.PROFILO_CLIENTE);
			System.out.println("isProfiloCliente: " + isProfiloCliente);
			if (isProfiloCliente!=null && isProfiloCliente) {
				request.getSession().removeAttribute(Costanti.PROFILO_CLIENTE);
				html = "/jsp/profilocliente.jsp";
			}
			else {
				html = "/noleggioServlet";
			}
			RequestDispatcher requestDispatcher; 
			requestDispatcher = request.getRequestDispatcher(html);
			requestDispatcher.forward(request, response);
			 //TODO vai a noleggioServlet e procedi con l'ultima parte di noleggio
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

