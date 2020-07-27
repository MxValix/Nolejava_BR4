package com.comunenapoli.progetto.web;

import java.io.IOException;
import java.text.ParseException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comunenapoli.progetto.businessLogic.BusinessLogicAuto;
import com.comunenapoli.progetto.businessLogic.BusinessLogicNoleggio;
import com.comunenapoli.progetto.model.Auto;
import com.comunenapoli.progetto.model.Utente;
import com.comunenapoli.progetto.utils.BusinessLogicAutoNoleggioUtils;
import com.comunenapoli.progetto.utils.Costanti;
import com.comunenapoli.progetto.utils.DataUtils;


@WebServlet("/homepageServlet")
public class HomepageServlet extends HttpServlet {

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
		BusinessLogicNoleggio businessLogicNoleggio = (BusinessLogicNoleggio) getServletContext().getAttribute(Costanti.BUSINESS_LOGIC_NOLEGGIO);
		BusinessLogicAuto businessLogicAuto = (BusinessLogicAuto) getServletContext().getAttribute(Costanti.BUSINESS_LOGIC_AUTO);
		List<Auto> listaAuto = new ArrayList<Auto>();
		
		//TODO campo nascosto obbligatorio con value form
		String hidden = request.getParameter("formcompliato");
		String html = "/jsp/homepage.jsp";
		boolean isHiddenEmpty = hidden==null || hidden.isEmpty() || hidden.equals("");
		if (isHiddenEmpty) {
			listaAuto = businessLogicAuto.getListaCompletaAuto();
			request.getSession().setAttribute(Costanti.LISTA_COMPLETA_AUTO, listaAuto);
		} else {
			listaAuto = effettuaRicerca(request, businessLogicAuto,businessLogicNoleggio);
			html += "#lista-auto";
		}
		
			
			RequestDispatcher requestDispatcher; 
			requestDispatcher = request.getRequestDispatcher(html);
			requestDispatcher.forward(request, response);

	}

	private List<Auto> effettuaRicerca(HttpServletRequest request, BusinessLogicAuto businessLogicAuto, BusinessLogicNoleggio businessLogicNoleggio) {
		try {
		
			String dataInizioNoleggioString = request.getParameter("datainizio");
			String dataFineNoleggioString = request.getParameter("datafine");
			String numeroPostiString = request.getParameter("numeroPosti");
			String prezzoAutoPerGiornoString = request.getParameter("prezzopergiorno");
			
			Date dataInizio = DataUtils.convertiDataFromString(dataInizioNoleggioString);
			Date dataFine = DataUtils.convertiDataFromString(dataFineNoleggioString);
			
			request.getSession().setAttribute(Costanti.DATA_INIZIO_NOLEGGIO, dataInizio);
			request.getSession().setAttribute(Costanti.DATA_FINE_NOLEGGIO, dataFine);

			
			String tipologiaAuto = request.getParameter("tipologia");
			String marcaAuto = request.getParameter("marca");
			String modelloAuto = request.getParameter("modello");
			String cambioAuto = request.getParameter("cambio");			
			String tipologiaCarburante = request.getParameter("carburante");
			Integer numeroPosti = null;
			



			if (numeroPostiString!=null && numeroPostiString.isEmpty()) {
				request.getSession().setAttribute(Costanti.NUMERO_POSTI_AUTO_SCELTA,cambioAuto);
				numeroPosti = Integer.parseInt(numeroPostiString);
			}
			
			request.getSession().setAttribute(Costanti.TIPOLOGIA_AUTO_SCELTA, tipologiaAuto);
			request.getSession().setAttribute(Costanti.MARCA_AUTO_SCELTA, marcaAuto);
			request.getSession().setAttribute(Costanti.MODELLO_AUTO_SCELTA,modelloAuto);
			request.getSession().setAttribute(Costanti.CAMBIO_AUTO_SCELTA,cambioAuto);
			request.getSession().setAttribute(Costanti.CARBURANTE_AUTO_SCELTA,tipologiaCarburante);
			request.getSession().setAttribute(Costanti.NUMERO_POSTI_AUTO_SCELTA, numeroPosti);

			
			//List<Auto> risultati = BusinessLogicAutoNoleggioUtils.filtroRicerca(dataInizio, dataFine, tipologiaAuto, businessLogicAuto, businessLogicNoleggio);
			List<Auto> risultati = BusinessLogicAutoNoleggioUtils.filtroRicerca(dataInizio, dataFine, marcaAuto, modelloAuto, cambioAuto, numeroPosti, tipologiaCarburante, tipologiaAuto, businessLogicAuto, businessLogicNoleggio);

			request.getSession().setAttribute(Costanti.LISTA_COMPLETA_AUTO, risultati);
			//TODO reindirizza alla jsp passandogli la request e response
			return risultati;

		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}

