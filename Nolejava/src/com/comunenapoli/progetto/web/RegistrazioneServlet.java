package com.comunenapoli.progetto.web;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDateTime;

import javax.servlet.RequestDispatcher;
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


@WebServlet("/registrazioneServlet")
public class RegistrazioneServlet extends HttpServlet {

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
		Integer effettuaRegistrazione = effettuaRegistrazione(request);
		String dispatch = "";
		String resultMessage = "";
		if (effettuaRegistrazione == Costanti.REGISTRAZIONE_VALIDA) {
			//TODO registrazione avvenuta con successo, attendi conferma
			
			//response.getWriter().println("<h1>Registrazione effettuata. Attendi la conferma.</h1>");
			Boolean registrazioneAvvenuta = true;
			
			request.setAttribute(Costanti.REGISTRAZIONE_AVVENUTA_EMAIL, registrazioneAvvenuta);
			dispatch = "/emailSendingServletCliente";
			//TODO pagina che rimanda
		}
		else if (effettuaRegistrazione == Costanti.REGISTRAZIONE_FALLITA_ETA) {
			//TODO registrazione non avvenuta, sei minorenne, rimanda in homepage
			response.getWriter().println("<h1>Registrazione fallita, sei minorenne.</h1>");
			
			resultMessage = "Registrazione fallita, solo gli utienti maggiorenni possono registrarsi a NoleJava";
            request.setAttribute("Message", resultMessage);
			dispatch = "/jsp/result.jsp";
			

		}
		else if (effettuaRegistrazione == Costanti.REGISTRAZIONE_FALLITA_UTENTE_ESISTENTE) {
			//TODO registrazione non avvenuta, utente esistente, rimanda al login
			//response.getWriter().println("<h1>Utente già registrato nel database.</h1>");
		
			
			resultMessage = "Registrazione fallita, utente già registrato nel database";
            request.setAttribute("Message", resultMessage);
			dispatch = "/jsp/result.jsp";


		}
		else {
			//TODO errore generico, rimanda alla homepage senza errore
			response.getWriter().println("<h1>Non ho la minima idea di cosa sia successo.</h1>");

		}
		RequestDispatcher requestDispatcher; 
		requestDispatcher = request.getRequestDispatcher(dispatch);
		requestDispatcher.forward(request, response);
	
	}
	
	
	public Integer effettuaRegistrazione (HttpServletRequest request) {
		BusinessLogicUtente businessLogicUtente = (BusinessLogicUtente)getServletContext().getAttribute(Costanti.BUSINESS_LOGIC_UTENTE);
		String nome = request.getParameter("nome");
		String cognome = request.getParameter("cognome");
		String dataNascitaString = request.getParameter("datanascita");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String staff = request.getParameter("staff");
		boolean checkNome = nome!=null && !nome.equals("");
		boolean checkCognome = cognome!=null && !cognome.equals("");
		boolean checkDataNascita = dataNascitaString!=null && !dataNascitaString.equals("");
		boolean checkEmail = email!=null && !email.equals("");
		boolean checkPassword = password!=null && !password.equals("") && password.length()>=8;
		boolean isStaff = staff!=null;
		boolean checkCondizioni = checkNome && checkCognome && checkDataNascita && checkEmail && checkPassword;		
		Integer checkRegistrazione = Costanti.ERRORE_GENERICO;
		try {
		    Date dataNascita = DataUtils.convertiDataFromString(dataNascitaString);
		    boolean checkMaggiorenne = DataUtils.dataNascita(dataNascita);
			if (checkCondizioni && checkMaggiorenne) {
				Ruolo ruoloUtente = new Ruolo();
				if (isStaff) {
					ruoloUtente.setId(Costanti.ID_RUOLO_STAFF);
					ruoloUtente.setNomeRuolo(Costanti.RUOLO_STAFF);
				}
				else {
					ruoloUtente.setId(Costanti.ID_RUOLO_CLIENTE);
					ruoloUtente.setNomeRuolo(Costanti.RUOLO_CLIENTE);
				}
				Utente utente = new Utente(email,password,nome,cognome,dataNascita,ruoloUtente);
				checkRegistrazione = businessLogicUtente.registrazione(utente);			
			}
			else if (!checkMaggiorenne) {
				checkRegistrazione = Costanti.REGISTRAZIONE_FALLITA_ETA;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return checkRegistrazione;
	}

}

