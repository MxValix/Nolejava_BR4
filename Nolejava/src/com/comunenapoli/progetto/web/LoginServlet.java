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


@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {

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
		String username = request.getParameter("email");
		String password = request.getParameter("password");
		boolean isUsernameValid = username!=null && !username.equals("");
		boolean isPasswordValid = password!=null && !password.equals("") && password.length()>=8;

		if (!(isUsernameValid && isPasswordValid)) { 
			//TODO rimanda a utente o password errate
		}
		else {
			BusinessLogicUtente businessLogicUtente = (BusinessLogicUtente)getServletContext().getAttribute(Costanti.BUSINESS_LOGIC_UTENTE);
			Utente utente = businessLogicUtente.login(username, password);
			if (utente!=null) {
				Integer ruolo = businessLogicUtente.checkRuolo(utente.getIdUtente());
				System.out.println("Ok, ho fatto il login");
				String html = "";
				if (utente.getIsVerificato()) {
					request.getSession().setAttribute(Costanti.USER_IN_SESSION, utente);
					if (ruolo == Costanti.ID_RUOLO_ADMIN) {
						//TODO reindirizza ad admin
						html = "/jsp/dashboard.jsp";
					}
					else if (ruolo == Costanti.ID_RUOLO_STAFF) {
						//TODO reindirizza a staff
						html = "/jsp/dashboard.jsp";

					} else if (ruolo == Costanti.ID_RUOLO_CLIENTE) {

					}				
				} else {
					response.getWriter().println("<h1>Login non verificato</h1>");
				}


			} else {
				response.getWriter().println("<h1>Username o password non validi</h1>");
			}
		}
	} 
}



