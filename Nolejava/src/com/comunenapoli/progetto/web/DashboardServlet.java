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

import com.comunenapoli.progetto.businessLogic.BusinessLogicUtente;
import com.comunenapoli.progetto.model.Utente;
import com.comunenapoli.progetto.utils.Costanti;


@WebServlet("/dashboardServlet")
public class DashboardServlet extends HttpServlet {

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
		List<Utente> utentiNonVerificati = businessLogicUtente.listaUtentiNonVerificato();
		request.setAttribute(Costanti.LISTA_UTENTI_NON_VERIFICATI, utentiNonVerificati);
		List<Utente> listaUtenti = businessLogicUtente.getListaUtenti();
		request.setAttribute(Costanti.LISTA_UTENTI, listaUtenti);
	
		String html = "/jsp/";
		String action = request.getParameter("action").toLowerCase();
		if (action.contains("utenti")) {
			html += "gestisciutenti.jsp";
		}
		else if (action.contains("utente")) {
			html += "verificautenti.jsp";
		}
		else if (action.contains("auto")) {
			
		}
		RequestDispatcher requestDispatcher; 
		requestDispatcher = request.getRequestDispatcher(html);
		requestDispatcher.forward(request, response);


	}

}

