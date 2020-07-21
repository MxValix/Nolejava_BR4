package com.comunenapoli.progetto.web;

import java.io.IOException;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comunenapoli.progetto.businessLogic.BusinessLogicNoleggio;
import com.comunenapoli.progetto.utils.Costanti;

@WebServlet("/prenotazioniClienteServlet")
public class PrenotazioniClienteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PrenotazioniClienteServlet() {
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
		BusinessLogicNoleggio businessLogicNoleggio = (BusinessLogicNoleggio)getServletContext().getAttribute(Costanti.BUSINESS_LOGIC_NOLEGGIO);
		String idNoleggioString = request.getParameter("idnoleggio");
		String action = request.getParameter("action").toLowerCase();
        String recipient = request.getParameter("recipient");
		System.out.println("action: " + action);
		String cancellaPrenotazione = "";
		boolean isCancellato = false;
		if (action.contains("cancella")) {
			Integer idNoleggio = Integer.parseInt(idNoleggioString);
			//Noleggio noleggio = businessLogicNoleggio.getNoleggiByIdNoleggio(idNoleggio);
			//businessLogicNoleggio.delete(noleggio);
			isCancellato = businessLogicNoleggio.deleteNoleggioByIdNoleggio(idNoleggio);
		} 
		if (isCancellato) {
			request.setAttribute(Costanti.CANCELLAZIONE_AVVENUTA, isCancellato);
			String html = "/emailSendingServlet";
			request.getRequestDispatcher(html).include(request,response);
		}
		
	}
		
	
	}
