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
import com.comunenapoli.progetto.businessLogic.BusinessLogicNoleggio;
import com.comunenapoli.progetto.businessLogic.BusinessLogicUtente;
import com.comunenapoli.progetto.model.Auto;
import com.comunenapoli.progetto.utils.Costanti;

/**
 * Servlet implementation class NotificheDashboard
 */
@WebServlet("/notificheDashboard")
public class NotificheDashboard extends HttpServlet {
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
		
		BusinessLogicUtente businessLogicUtente = (BusinessLogicUtente)getServletContext().getAttribute(Costanti.BUSINESS_LOGIC_UTENTE);
		request.setAttribute(Costanti.NUMERO_UTENTI_NON_VERIFICATI, businessLogicUtente.listaUtentiNonVerificato().size());
		
		BusinessLogicNoleggio businessLogicNoleggio = (BusinessLogicNoleggio)getServletContext().getAttribute(Costanti.BUSINESS_LOGIC_NOLEGGIO);
		request.setAttribute(Costanti.NUMERO_NOLEGGI, businessLogicNoleggio.getListaCompletaNoleggi().size());
		
		request.setAttribute(Costanti.NUMERO_UTENTI, businessLogicUtente.getListaUtenti().size());
		
		BusinessLogicAuto businessLogicAuto = (BusinessLogicAuto)getServletContext().getAttribute(Costanti.BUSINESS_LOGIC_AUTO);
		request.setAttribute(Costanti.NUMERO_AUTO, businessLogicAuto.getListaCompletaAuto().size());
		
		RequestDispatcher requestDispatcher; 
		requestDispatcher = request.getRequestDispatcher("/jsp/private/dashboard.jsp");
		requestDispatcher.forward(request, response);
		
		
	}



}
