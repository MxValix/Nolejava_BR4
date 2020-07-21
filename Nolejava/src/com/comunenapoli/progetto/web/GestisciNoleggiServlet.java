package com.comunenapoli.progetto.web;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comunenapoli.progetto.businessLogic.BusinessLogicAuto;
import com.comunenapoli.progetto.businessLogic.BusinessLogicNoleggio;
import com.comunenapoli.progetto.businessLogic.BusinessLogicUtente;
import com.comunenapoli.progetto.model.Auto;
import com.comunenapoli.progetto.model.Noleggio;
import com.comunenapoli.progetto.model.Utente;
import com.comunenapoli.progetto.utils.Costanti;
import com.comunenapoli.progetto.utils.DataUtils;

@WebServlet("/gestisciNoleggiServlet")
public class GestisciNoleggiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GestisciNoleggiServlet() {
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
		boolean isCancellato = false;
		if (action.contains("cancella")) {
			Integer idNoleggio = Integer.parseInt(idNoleggioString);
			isCancellato = businessLogicNoleggio.deleteNoleggioByIdNoleggio(idNoleggio);
		} 
		else if (action.contains("campo")) {
			String ricerca = request.getParameter("ricerca").toLowerCase();
			String filtro = request.getParameter("filtro").toLowerCase();
			if (ricerca.contains("utente")) {
				BusinessLogicUtente businessLogicUtente = (BusinessLogicUtente)getServletContext().getAttribute(Costanti.BUSINESS_LOGIC_UTENTE);
				Utente utente = businessLogicUtente.getUtenteByEmail(filtro);
				List<Noleggio> noleggiUtente = businessLogicNoleggio.getNoleggiByUtente(utente);
				request.getSession().setAttribute(Costanti.LISTA_COMPLETA_NOLEGGI, noleggiUtente);

			}
			else if (ricerca.contains("marca")) {
				BusinessLogicAuto businessLogicAuto = (BusinessLogicAuto)getServletContext().getAttribute(Costanti.BUSINESS_LOGIC_AUTO);
				List<Auto> autoByMarca = businessLogicAuto.getAutoByMarca(filtro);
				List<Noleggio> noleggiAuto = businessLogicNoleggio.getNoleggiByListaAuto(autoByMarca);
				request.getSession().setAttribute(Costanti.LISTA_COMPLETA_NOLEGGI, noleggiAuto);

			}

		}
		else if (action.contains("date")) {
			try {
				String dataInizioString = request.getParameter("datainizio");
				String dataFineString = request.getParameter("datafine");
				Date dataInizio = DataUtils.convertiDataFromString(dataInizioString);
				Date dataFine = DataUtils.convertiDataFromString(dataFineString);
				List<Noleggio> noleggiDate = businessLogicNoleggio.getNoleggiByDataInizioDataFine(dataInizio, dataFine);
				request.getSession().setAttribute(Costanti.LISTA_COMPLETA_NOLEGGI, noleggiDate);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		
		if (isCancellato) {
			List<Noleggio> listaNoleggi = businessLogicNoleggio.getListaCompletaNoleggi();
			request.getSession().setAttribute(Costanti.LISTA_COMPLETA_NOLEGGI, listaNoleggi);
		}
		
		String html = "/jsp/gestiscinoleggi.jsp";
		request.getRequestDispatcher(html).forward(request,response);
	}
		
	
	}
