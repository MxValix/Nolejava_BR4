package com.comunenapoli.progetto.web;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.time.LocalDate;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comunenapoli.progetto.businessLogic.BusinessLogicUtente;
import com.comunenapoli.progetto.model.Ruolo;
import com.comunenapoli.progetto.model.Utente;
import com.comunenapoli.progetto.utils.Costanti;
import com.comunenapoli.progetto.utils.DataUtils;


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
		Utente utente = (Utente) request.getSession().getAttribute(Costanti.USER_IN_SESSION);
		BusinessLogicUtente businessLogicUtente = (BusinessLogicUtente)getServletContext().getAttribute(Costanti.BUSINESS_LOGIC_UTENTE);
		String idUtenteString = request.getParameter("idUtente");
		if (!idUtenteString.isEmpty()) {
			 String nome = request.getParameter("nome");
			 String cognome = request.getParameter("cognome");
			 String dataNascitaString = request.getParameter("dataNascita");
			 String email = request.getParameter("email");
			 String password = request.getParameter("password");
			 System.out.println("sto per modificare");
			 try {
				Date dataNascita = DataUtils.convertiDataFromString(dataNascitaString);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			businessLogicUtente.updateDatiPersonali(utente, email, password, nome, cognome);
			response.getWriter().println("Dati aggiornati con successo");
		}
	}
	
	


}

