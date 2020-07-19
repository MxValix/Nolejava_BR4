package com.comunenapoli.progetto.web;

import java.io.IOException;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comunenapoli.progetto.businessLogic.BusinessLogicUtente;
import com.comunenapoli.progetto.model.Utente;
import com.comunenapoli.progetto.utils.Costanti;

@WebServlet("/gestisciUtenti")
public class GestisciUtentiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GestisciUtentiServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

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
		String idUtenteString = request.getParameter("idutente");
		String action = request.getParameter("action").toLowerCase();
        String recipient = request.getParameter("recipient");
		System.out.println("action: " + action);
		String eliminaUtente = "";
		String promuoviUtente = "";
		String verificaUtente = "";
		if (action.contains("elimina")) {
			eliminaUtente = action;
		} else if (action.contains("promuovi")){
			promuoviUtente = action;
		}
		else {
			verificaUtente = action;
		}
		Integer idUtente = Integer.parseInt(idUtenteString);
		Utente utente = businessLogicUtente.getUtenteById(idUtente);
		Integer ruoloIdUtente = utente.getRuolo().getId();
		boolean isPromosso = false;
		boolean isRimosso = false;
		boolean isVerificato = false;

		boolean checkPromuoviUtente = promuoviUtente!=null && !promuoviUtente.isEmpty();
		boolean checkEliminaUtente = eliminaUtente!=null && !eliminaUtente.isEmpty();
		boolean checkVerificaUtente = verificaUtente!=null && !verificaUtente.isEmpty();

		if (checkPromuoviUtente && ruoloIdUtente == Costanti.ID_RUOLO_CLIENTE) {
			isPromosso = businessLogicUtente.updateRuolo(utente, Costanti.ID_RUOLO_STAFF);
		}
		else if (checkEliminaUtente) {
			businessLogicUtente.delete(idUtente);
			isRimosso = true;
		}
		else if (checkVerificaUtente) {
			isVerificato = true;
			businessLogicUtente.verificaUtente(utente, isVerificato);
		}
		
		if (isPromosso) {
			//TODO hai promosso l'utente a staff
			request.setAttribute(Costanti.UTENTE_PROMOSSO, isPromosso);
			String html = "/emailSendingServlet";
			request.getRequestDispatcher(html).include(request,response);
		}
		else if (isRimosso) {
			//TODO hai rimosso l'utente
			request.setAttribute(Costanti.UTENTE_RIMOSSO, isRimosso);
			String html = "/emailSendingServlet";
			request.getRequestDispatcher(html).include(request,response);
		}
		else if (isVerificato) {
			//TODO hai verificato l'utente
			request.setAttribute(Costanti.UTENTE_VERIFICATO, isRimosso);
			String html = "/emailSendingServlet";
			request.getRequestDispatcher(html).include(request,response);
		}
		else {
			//TODO operazione non avvenuta, ritenta
			System.out.println("Errore generico");
		}
	
	}
}
