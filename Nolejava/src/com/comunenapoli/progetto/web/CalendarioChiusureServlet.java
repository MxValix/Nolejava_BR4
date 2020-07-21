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
import com.comunenapoli.progetto.model.CalendarioChiusure;
import com.comunenapoli.progetto.model.Noleggio;
import com.comunenapoli.progetto.model.Utente;
import com.comunenapoli.progetto.utils.Costanti;
import com.comunenapoli.progetto.utils.DataUtils;

@WebServlet("/calendarioChiusureServlet")
public class CalendarioChiusureServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CalendarioChiusureServlet() {
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
		try {
		BusinessLogicNoleggio businessLogicNoleggio = (BusinessLogicNoleggio)getServletContext().getAttribute(Costanti.BUSINESS_LOGIC_NOLEGGIO);
		String action = request.getParameter("action").toLowerCase();
		String dataInizioString = request.getParameter("datainizio");
		String dataFineString = request.getParameter("datafine");
		Date dataInizio = DataUtils.convertiDataFromString(dataInizioString);
		Date dataFine = DataUtils.convertiDataFromString(dataFineString);
		businessLogicNoleggio.deleteNoleggiByDataInizioDataFine(dataInizio,dataFine);
		
		List<CalendarioChiusure> calendarioChiusureList = businessLogicNoleggio.getListaCalendarioChiusure();
		request.getSession().setAttribute(Costanti.LISTA_COMPLETA_CHIUSURE, calendarioChiusureList);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String html = "/jsp/calendario.jsp";
		request.getRequestDispatcher(html).forward(request,response);
	}
		
	
	}
