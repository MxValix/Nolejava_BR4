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
 		Auto auto = new Auto ("Berlina", "Audi", "A3 - Sportback", "Manuale", 1498.0, "Grigio", 5, "AA000BB", "Benzina", 150.0, "A3.jpg");
 		Auto auto2 = new Auto ("Berlina", "Alfa Romeo", "Giulietta", "Automatico", 1956.0, "Nero", 4, "CC111DD", "Gasolio", 130.0, "giulietta.jpg");
 		Auto auto3 = new Auto ("SUV", "BMW", "X3", "Automatico", 2993.0, "Nero", 5, "EE222FF", "Benzina", 280.0, "x3.jpg");
 		Auto auto4 = new Auto ("Utilitaria", "Citroen", "C1", "Manuale", 998.0, "Nero", 4, "GG333HH", "Benzina", 70.0, "c1.jpg");
 		Auto auto5 = new Auto ("Berlina", "Citroen", "C3-Aircross", "Manuale", 1499.0, "Nero", 5, "II444LL", "Gasolio", 110.0, "c3.jpg");
 		
 		Auto auto6 = new Auto ("Utilitaria", "Fiat", "500", "Manuale", 1242.0, "Grigio", 4, "MM555NN", "Benzina", 80.0, "500.jpg");
 		Auto auto7 = new Auto ("SUV", "Pegeout", "3008", "Automatico", 1997.0, "Grigio", 5, "OO666PPP", "Gasolio", 240.0, "3008.jpg");
 		Auto auto8 = new Auto ("Utilitaria", "Ford", "Fiesta", "Manuale", 1124.0, "Bianco", 4, "FF333HH", "Benzina", 110.0, "fiesta.jpg");
 		Auto auto9 = new Auto ("SUV", "Ford", "Kuga", "Automatico", 1500.0, "Bianco", 5, "UU999VV", "Benzina", 230.0, "kuga.jpg");
 		Auto auto10 = new Auto ("Utilitaria", "Fiat", "Panda", "Manuale", 1242.0, "Bianca", 4, "QQ777RR","Benzina", 80.0, "panda.jpg");
 		
 		Auto auto11= new Auto ("SUV", "Kia", "Kia-Sportage", "Automatico", 1598.0, "Grigio", 5, "ZZ661ZZ", "Gasolio", 230.0, "Sportage.jpg");
 		Auto auto12 = new Auto ("Utilitaria","Lancia", "Ypsilon", "Manuale", 1242.0, "Sabbia", 4, "KK000WW", "Benzina", 110.0, "ypsilon.jpg");
 		Auto auto13 = new Auto ("Utilitaria", "Land Rover", "Discovery", "Automatico", 2990.0, "Grigio", 7, "XX303BB", "Benzina", 290.0, "discovery.jpg");
 		Auto auto14 = new Auto ("SUV", "Lamborghini", "URUS", "Automatico", 3996.0, "Grigio", 5, "AA078BN", "Benzina", 1200.0, "urus.jpg");
 		Auto auto15 = new Auto ("Berlina", "Mercedes", "Classe A", "Automatico", 1991.0, "Grigio", 5, "BB505DD", "Benzina", 280.0, "ClasseA.jpg");
 		
 		Auto auto16 = new Auto ("Mini Van", "Mercedes", "Vito", "Automatico", 2143.0, "Grigio", 9, "EE505GG", "Benzina", 380.0, "vito.jpg");
 		Auto auto17 = new Auto ("SUV", "Nissan", "Qashqai", "Automatico", 1700.0, "Grigio", 7, "SS929ZZ", "Benzina", 200.0, "Qashqai.jpg");
 		Auto auto18 = new Auto ("Utilitaria", "Opel", "Corsa", "Manuale", 1499.0, "Bianco", 5, "HH606LL", "Gasolio", 100.0, "corsa.jpg");
 		Auto auto19 = new Auto ("SUV", "Opel", "Mokka", "Automatico", 1498.0, "Grigio", 5, "II707MM", "Gasolio", 170.0, "mokka.jpg");
 		Auto auto20 = new Auto ("SUV", "Reanult", "Kadjar", "Manuale", 1600.0, "Bianco", 5, "NN808PP", "Benzina", 190.0, "kadjar.jpg");
 		
 		Auto auto21 = new Auto ("Station Wagon", "Reanult", "Clio - Sporter", "Manuale", 1500.0, "Grigio", 5, "OO909QQ", "Gasolio", 170.0, "cliosporter.jpg");
 		Auto auto22 = new Auto ("Utilitaria", "Smart", "For Four", "Automatico", 999.0, "Bianco", 4, "RR102TT", "Benzina", 100.0, "smart.jpg");
 		Auto auto23 = new Auto ("Utilitaria", "Toyota", "Aygo", "Automatico", 998.0, "Grigio", 4, "VV489VV", "Benzina", 80.0, "aygo.jpg");
 		Auto auto24 = new Auto ("SUV", "Toyota", "RAV-4", "Automatico", 2487.0, "Bianco", 5, "ZZ709TT", "Benzina", 240.0, "rav4.jpg");
 		Auto auto25 = new Auto ("Utilitaria", "Volkswagen", "Polo", "Manuale", 1498.0, "Nero", 4, "SS201UU", "Benzian", 100.0, "polo.jpg");
 		/*
 		Auto auto26 = new Auto ("SUV", "Volkswagen", "Tiguan", "Automatico", 2000.0, "Grigio", 5, "VV302KK", "Benzina", 250.0, "tiguan.jpg");
 		Auto auto27 = new Auto ("Sportiva", "Mustang", "Fastback", "Automatico", 4951.0, "Blu e Nero", 2, "ZA672BT", "Benzina", 700.0, "fastback.jpg");
 		Auto auto28 = new Auto ("SUV", "Jeep", "Compass", "Automatico", 1598.0, "Bianca", 5, "BN498SL", "Benzina", 250.0, "compass.jpg");
 		Auto auto29 = new Auto ("SUV", "Alfa Romeo", "Stelvio", "Automatico", 2143.0, "Grigio", 5, "LR456BD", "Gasolio", 230.0, "Stelvio.jpg");
 		Auto auto30 = new Auto ("SUV", "Audi", "Q7", "Automatico", 2967.0, "Nero", 7, "MN571DN", "Gasolio", 400.0, "q7.jpg");
	 	*/
		businessLogicAuto.create(auto);
		businessLogicAuto.create(auto2);
		businessLogicAuto.create(auto3);
		businessLogicAuto.create(auto4);
		businessLogicAuto.create(auto5);
		businessLogicAuto.create(auto6);
		businessLogicAuto.create(auto7);
		businessLogicAuto.create(auto8);
		businessLogicAuto.create(auto9);
		businessLogicAuto.create(auto10);
		businessLogicAuto.create(auto11);
		businessLogicAuto.create(auto12);
		businessLogicAuto.create(auto13);
		businessLogicAuto.create(auto14);
		businessLogicAuto.create(auto15);
		businessLogicAuto.create(auto16);
		businessLogicAuto.create(auto17);
		businessLogicAuto.create(auto18);
		businessLogicAuto.create(auto19);
		businessLogicAuto.create(auto20);
		businessLogicAuto.create(auto21);
		businessLogicAuto.create(auto22);
		businessLogicAuto.create(auto23);
		businessLogicAuto.create(auto24);
		businessLogicAuto.create(auto25);
		/*
		businessLogicAuto.create(auto26);
		businessLogicAuto.create(auto27);
		businessLogicAuto.create(auto28);
		businessLogicAuto.create(auto29);
		businessLogicAuto.create(auto30);
		*/
	    
	   
	}
	
	
	public void destroy(){	
		EntityManager entityManager = (EntityManager) getServletContext().getAttribute(Costanti.CHIAVE_SERVLET);	
		EntityManagerUtils.chiudiConnessione(entityManager);
	}
	
 
}
