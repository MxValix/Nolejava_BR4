package com.comunenapoli.progetto.web;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comunenapoli.progetto.businessLogic.BusinessLogicCarta;
import com.comunenapoli.progetto.businessLogic.BusinessLogicNoleggio;
import com.comunenapoli.progetto.businessLogic.BusinessLogicUtente;
import com.comunenapoli.progetto.model.CartaDiCredito;
import com.comunenapoli.progetto.model.Noleggio;
import com.comunenapoli.progetto.model.Utente;
import com.comunenapoli.progetto.utils.Costanti;


@WebServlet("/profiloClienteServlet")
public class ProfiloClienteServlet extends HttpServlet {

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
		//TODO filtro area solo admin e staff
		
		Utente utente = (Utente) request.getSession().getAttribute(Costanti.USER_IN_SESSION);
		BusinessLogicUtente businessLogicUtente = (BusinessLogicUtente)getServletContext().getAttribute(Costanti.BUSINESS_LOGIC_UTENTE);
		BusinessLogicCarta businessLogicCarta = (BusinessLogicCarta)getServletContext().getAttribute(Costanti.BUSINESS_LOGIC_CARTA);
		
		List<Utente> utentiNonVerificati = businessLogicUtente.listaUtentiNonVerificato();
		List<Utente> listaUtenti = businessLogicUtente.getListaUtenti();
		
		request.setAttribute(Costanti.LISTA_UTENTI_NON_VERIFICATI, utentiNonVerificati);
		request.setAttribute(Costanti.LISTA_UTENTI, listaUtenti);
	
		String html = "/jsp/";
		String action = request.getParameter("action").toLowerCase();
		if (action.contains("dati personali")) {
			html += "datipersonali.jsp";
		}
		else if (action.contains("prenotazioni")) {
			BusinessLogicNoleggio businessLogicNoleggio = (BusinessLogicNoleggio)getServletContext().getAttribute(Costanti.BUSINESS_LOGIC_NOLEGGIO);
			List<Noleggio> noleggiUtente = businessLogicNoleggio.getNoleggiByUtente(utente);
			request.getSession().setAttribute(Costanti.NOLEGGI_UTENTE, noleggiUtente);

			html += "prenotazionicliente.jsp";
		}
		else if (action.contains("dati carta")) {
			request.getSession().setAttribute(Costanti.PROFILO_CLIENTE, true);
			CartaDiCredito carta = businessLogicCarta.getCartaByUtente(utente);
			if (carta!=null) {
				request.setAttribute(Costanti.CARTA_IN_SESSION, carta);
			}
			html += "carta.jsp";
		}
		else {
			request.removeAttribute(Costanti.CARTA_IN_SESSION);
			html += "carta.jsp";
			
		}
		RequestDispatcher requestDispatcher; 
		requestDispatcher = request.getRequestDispatcher(html);
		requestDispatcher.forward(request, response);


	}

}

