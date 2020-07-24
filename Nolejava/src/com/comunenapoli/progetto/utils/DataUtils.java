package com.comunenapoli.progetto.utils;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.GregorianCalendar;

public class DataUtils {
	
	public static Date convertiDataFromLocalDate(LocalDate localDate) {
		Date date = Date.valueOf(localDate);
		return date;
	}
	
	public static Date convertiDataFromString(String dataString) throws ParseException {
		Date date = Date.valueOf(dataString); 
	    return date;
	}
	
	public static String convertiDataFromSqlDate(Date dataSql) throws ParseException {
	    SimpleDateFormat formatter= new SimpleDateFormat("dd-MMM-yyyy");  
		String date = (String) formatter.format(dataSql);
		return date;
	}
	
	public static boolean dataNascita(Date dataNascitaSql) throws Exception {
	    int anniPassati = getDifferenzaAnni(dataNascitaSql);
	    if (anniPassati>=18) {
	    	return true;
	    }
		return false;
	}
	
    public static int getDifferenzaAnni(Date dataNascitaSql) {
        Calendar primoCalendario = GregorianCalendar.getInstance();
        Calendar secondoCalendario = GregorianCalendar.getInstance();
		java.util.Date dataOggi = new java.util.Date();
	    java.util.Date dataNascita = new java.util.Date(dataNascitaSql.getTime());

	    primoCalendario.setTime(dataNascita);
        primoCalendario.add(Calendar.DATE,1);
	    secondoCalendario.setTime(dataOggi);
	    
	    secondoCalendario.add(Calendar.DAY_OF_YEAR, 1 - primoCalendario.get(Calendar.DAY_OF_YEAR));
	    int differenzaAnni = secondoCalendario.get(Calendar.YEAR) - primoCalendario.get(Calendar.YEAR);
        return differenzaAnni;
    }

	public static boolean dataScadenza(Date sqlDataScadenza) throws Exception {
		java.util.Date dateOggi = new java.util.Date();
		java.util.Date dataScadenza = new java.util.Date(sqlDataScadenza.getTime());
		
		if(dataScadenza.before(dateOggi)) {
			return false;
		}
		
		if(dataScadenza.after(dateOggi)) {
			return true;
		}
		
		if(dataScadenza.equals(dateOggi)) {
			return true;
		}
		
		return false;
	}
	
	public static int getDifferenzaGiorni(Date dataInizio, Date dataFine) {
	    int differenzaGiorni = 0;
	    long diff = dataFine.getTime() - dataInizio.getTime();
	    long differenzaGiorniLong = diff / (24 * 60 * 60 * 1000) + 1;
	    differenzaGiorni = (int) differenzaGiorniLong;
	    return differenzaGiorni;
	}

	public static Date getDataCompletaFromMeseEdAnno(Integer mese, Integer anno) {
        Calendar calendar = Calendar.getInstance();
        calendar.clear();
        calendar.set(Calendar.MONTH, mese);
        calendar.set(Calendar.YEAR, anno);
        java.util.Date date = calendar.getTime();
        java.sql.Date sqlDate = new java.sql.Date(date.getTime());
        return sqlDate;
	}
	
}
