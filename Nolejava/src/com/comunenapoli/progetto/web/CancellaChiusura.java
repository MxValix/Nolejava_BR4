package com.comunenapoli.progetto.web;

import java.io.IOException;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comunenapoli.progetto.businessLogic.BusinessLogicCarta;
import com.comunenapoli.progetto.businessLogic.BusinessLogicNoleggio;
import com.comunenapoli.progetto.businessLogic.BusinessLogicPatente;
import com.comunenapoli.progetto.businessLogic.BusinessLogicUtente;
import com.comunenapoli.progetto.model.CalendarioChiusure;
import com.comunenapoli.progetto.model.Utente;
import com.comunenapoli.progetto.utils.Costanti;


@WebServlet("/cancellaChiusura")
public class CancellaChiusura extends HttpServlet {
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
		BusinessLogicNoleggio businessLogicNoleggio = (BusinessLogicNoleggio) getServletContext().getAttribute(Costanti.BUSINESS_LOGIC_NOLEGGIO);
		
		String idCalendarioString = request.getParameter("idCalendario").toLowerCase();
		
		
		if (idCalendarioString != null && !idCalendarioString.isEmpty()) {
			Integer idCalendario = Integer.valueOf(idCalendarioString);
			
			CalendarioChiusure calendarioChiusure = businessLogicNoleggio.getChiusuraByIdCalendario(idCalendario);
			
			businessLogicNoleggio.deleteCalendario(calendarioChiusure);
			
			getServletContext().getRequestDispatcher("/jsp/private/resultcancellazionecalendario.jsp").forward(request, response);
			
			
		}
		
	
	}
}