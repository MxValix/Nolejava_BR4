package com.comunenapoli.progetto.web;

import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

import com.comunenapoli.progetto.businessLogic.AutoDao;
import com.comunenapoli.progetto.businessLogic.BusinessLogicAuto;
import com.comunenapoli.progetto.businessLogic.BusinessLogicCarta;
import com.comunenapoli.progetto.businessLogic.BusinessLogicNoleggio;
import com.comunenapoli.progetto.businessLogic.BusinessLogicPatente;
import com.comunenapoli.progetto.businessLogic.BusinessLogicUtente;
import com.comunenapoli.progetto.businessLogic.CalendarioChiusureDao;
import com.comunenapoli.progetto.businessLogic.CartaDiCreditoDao;
import com.comunenapoli.progetto.businessLogic.NoleggioDao;
import com.comunenapoli.progetto.businessLogic.PatenteDao;
import com.comunenapoli.progetto.businessLogic.UtenteDao;
import com.comunenapoli.progetto.model.Auto;
import com.comunenapoli.progetto.model.Noleggio;
import com.comunenapoli.progetto.utils.BusinessLogicRuoloUtils;
import com.comunenapoli.progetto.utils.BusinessLogicUtenteUtils;
import com.comunenapoli.progetto.utils.Costanti;
import com.comunenapoli.progetto.utils.EntityManagerUtils;



@WebServlet(value="/iS", loadOnStartup = 1)
public class InitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public void init() throws ServletException {
		
		EntityManager entityManager = EntityManagerUtils.apriConnessione();
		
		UtenteDao utenteDao = new UtenteDao(entityManager);
		//RuoloDao ruoloDao = new RuoloDao(entityManager);
		PatenteDao patenteDao = new PatenteDao(entityManager);
		CartaDiCreditoDao cartaDao = new CartaDiCreditoDao(entityManager);
		AutoDao autoDao = new AutoDao(entityManager);
		NoleggioDao noleggioDao = new NoleggioDao(entityManager);
		CalendarioChiusureDao calendarioChiusureDao = new CalendarioChiusureDao(entityManager);


	    BusinessLogicUtente businessLogicUtente = new BusinessLogicUtente(entityManager,utenteDao);
	    BusinessLogicPatente businessLogicPatente = new BusinessLogicPatente(entityManager,patenteDao);
	    BusinessLogicCarta businessLogicCarta = new BusinessLogicCarta(entityManager,cartaDao);
	    BusinessLogicAuto businessLogicAuto = new BusinessLogicAuto(entityManager,autoDao);
	    BusinessLogicNoleggio businessLogicNoleggio = new BusinessLogicNoleggio(entityManager,noleggioDao,calendarioChiusureDao, autoDao);


	    
	    
		getServletContext().setAttribute(Costanti.CHIAVE_SERVLET, entityManager);		
		getServletContext().setAttribute(Costanti.CHIAVE_UTENTE_DAO, utenteDao);
		getServletContext().setAttribute(Costanti.BUSINESS_LOGIC_UTENTE, businessLogicUtente);
		//getServletContext().setAttribute(Costanti.BUSINESS_LOGIC_RUOLO, businessLogicRuolo);
		
		getServletContext().setAttribute(Costanti.BUSINESS_LOGIC_AUTO, businessLogicAuto);
		getServletContext().setAttribute(Costanti.BUSINESS_LOGIC_NOLEGGIO, businessLogicNoleggio);
		getServletContext().setAttribute(Costanti.BUSINESS_LOGIC_PATENTE, businessLogicPatente);
		getServletContext().setAttribute(Costanti.BUSINESS_LOGIC_UTENTE, businessLogicUtente);
		getServletContext().setAttribute(Costanti.BUSINESS_LOGIC_CARTA, businessLogicCarta);

		BusinessLogicRuoloUtils.generaRuoli(entityManager);
	    BusinessLogicUtenteUtils.creaAdmin(entityManager);
	  
	    // creazione auto
		Auto auto = new Auto ("Berlina", "Audi", "A3 - Sportback", "Manuale", 1498.0, "Grigio", 5, "AA000BB", "Benzina", 200.0, "gijrog");
		Auto auto2 = new Auto ("Berlina", "Alfa Romeo", "Giulietta", "Automatico", 1956.0, "Nero", 4, "CC111DD", "Gasolio", 130.0, "gijrog");
		Auto auto3 = new Auto ("SUV", "BMW", "X3", "Automatico", 2993.0, "Nero", 5, "EE222FF", "Benzina", 200.0, "gijrog");
		
		Auto auto4 = new Auto ("Utilitaria", "Citroen", "C1", "Manuale", 998.0, "Nero", 4, "GG333HH", "Benzina", 70.0, "gijrog");
		Auto auto5 = new Auto ("Berlina", "Citroen", "C3-Aircross", "Manuale", 1499.0, "Nero", 5, "II444LL", "Gasolio", 1300.0, "gijrog");
		
		Auto auto6 = new Auto ("Utilitaria", "Fiat", "500", "Manuale", 1242.0, "Grigio", 4, "MM555NN", "Benzina", 140.0, "gijrog");
		Auto auto7 = new Auto ("SUV", "Pegeout", "Pegeaout-3008", "Automatico", 1997.0, "Grigio", 5, "OO666PPP", "Gasolio", 200.0, "gijrog");
		
		Auto auto8 = new Auto ("Utilitaria", "Ford", "Fiesta", "Manuale", 1124.0, "Bianco", 4, "FF333HH", "Benzina", 110.0, "gijrog");
		Auto auto9 = new Auto ("SUV", "Ford", "Kuga", "Automatico", 1500.0, "Nero", 5, "UU999VV", "Benzina", 1500.0, "gijrog");
		
		Auto auto10 = new Auto ("Utilitaria", "Fiat", "Panda", "Manuale", 1242.0, "Bianca", 4, "QQ777RR","Benzina", 80.0, "gijrog");
		Auto auto11= new Auto ("SUV", "Kia", "Kia-Sportage", "Automatico", 1598.0, "Grigio", 5, "ZZ661ZZ", "Gasolio", 200.0, "gijrog");
		
		
		
		businessLogicAuto.create(auto);
		businessLogicAuto.create(auto2);
		businessLogicAuto.create(auto3);
		businessLogicAuto.create(auto4);
		businessLogicAuto.create(auto5);
		businessLogicAuto.create(auto6);
		businessLogicAuto.create(auto7);
		businessLogicAuto.create(auto9);
		businessLogicAuto.create(auto10);
		businessLogicAuto.create(auto11);
	    
	   
	}
	
	
	public void destroy(){	
		EntityManager entityManager = (EntityManager) getServletContext().getAttribute(Costanti.CHIAVE_SERVLET);	
		EntityManagerUtils.chiudiConnessione(entityManager);
	}
	
 
}
