package com.comunenapoli.progetto.utils;

public interface Costanti {


	public final static Integer ID_RUOLO_ADMIN = 1;
	public final static Integer ID_RUOLO_STAFF = 2;
	public final static Integer ID_RUOLO_CLIENTE = 3;

	public final static String RUOLO_ADMIN = "admin";
	public final static String RUOLO_STAFF = "staff";
	public final static String RUOLO_CLIENTE = "cliente";


	public final static String USER_IN_SESSION = "sessionUser";
	public final static String AUTO_IN_SESSION = "sessionAuto";
	public final static String CHIAVE_RUOLO_SESSIONE = "chiaveSessione";


	public final static String CHIAVE_SESSIONE = "chiaveSessione";


	public final static String CHIAVE_SERVLET = "chiaveServlet";

	public static final String CHIAVE_UTENTE_DAO = "chiaveUtenteDao";

	public static final String BUSINESS_LOGIC_UTENTE = "businessLogicUtente"; 
	public static final String BUSINESS_LOGIC_RUOLO = "businessLogicRuolo"; 
	public static final String BUSINESS_LOGIC_AUTO = "businessLogicAuto"; 
	public static final String BUSINESS_LOGIC_NOLEGGIO = "businessLogicNoleggio"; 
	public static final String BUSINESS_LOGIC_PATENTE = "businessLogicPatente"; 
	public static final String BUSINESS_LOGIC_CARTA = "businessLogicCarta"; 


	public final static Integer REGISTRAZIONE_VALIDA = 1;
	public final static Integer REGISTRAZIONE_FALLITA_UTENTE_ESISTENTE = 0;
	public final static Integer REGISTRAZIONE_FALLITA_ETA = -1;

	public final static Integer ERRORE_GENERICO = -2;
	public final static Integer MODIFICA_FALLITA = 0;

	public static final String LISTA_COMPLETA_AUTO = "listaCompletaAuto";
	public static final String LISTA_UTENTI_NON_VERIFICATI = "listaUtentiNonVerificati";
	public static final String LISTA_UTENTI = "listaUtenti";
	public static final String LISTA_COMPLETA_NOLEGGI = "listaCompletaNoleggi";
	public static final String LISTA_COMPLETA_CHIUSURE = "listaCompletaChiusure";



	public final static String DATA_INIZIO_NOLEGGIO = "dataInizioNoleggio";
	public final static String DATA_FINE_NOLEGGIO = "dataFineNoleggio";

	public static final String NUMERO_CARTA = "numeroCarta";
	public static final String CVV_CARTA = "cvvCarta";
	public static final String NUMERO_PATENTE = "numeroPatente";
	
	
	public static final String TIPOLOGIA_AUTO_SCELTA = "tipologiaAuto";
	public static final String MARCA_AUTO_SCELTA = "marcaAuto";
	public static final String MODELLO_AUTO_SCELTA = "modelloAuto";
	public static final String CAMBIO_AUTO_SCELTA = "cambioAutoScelta";
	public static final String CARBURANTE_AUTO_SCELTA = "carburanteAutoScelta";
	public static final String NUMERO_POSTI_AUTO_SCELTA = "numeroPostiAutoScelta";


	public static final String UTENTE_PROMOSSO = "utentePromosso";
	public static final String UTENTE_VERIFICATO = "utenteVerificato";
	public static final String UTENTE_RIMOSSO = "utenteRimosso";
	public static final String PROFILO_CLIENTE = "profiloCliente";
	public static final String CARTA_IN_SESSION = "cartaInSession";
	public static final String NOLEGGI_UTENTE = "noleggiUtente";
	public static final String CANCELLAZIONE_AVVENUTA = "cancellazioneAvvenuta";
	
	



}
