package com.comunenapoli.progetto.web;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comunenapoli.progetto.model.Auto;
import com.comunenapoli.progetto.model.Utente;
import com.comunenapoli.progetto.utils.Costanti;
import com.comunenapoli.progetto.utils.EmailUtility;
import com.comunenapoli.progetto.utils.EmailWithPdfUtility;
 

@WebServlet("/emailSendingServletInvoice")
public class EmailSendingServletInvoice extends HttpServlet {
  
	private static final long serialVersionUID = 1L;
	
	private String smtpHost;
    private String smtpPort;
    private String sender;
    private String pass;
 
    public void init() {
        // reads SMTP server setting from web.xml file
        ServletContext context = getServletContext();
        smtpHost = context.getInitParameter("host");
        smtpPort = context.getInitParameter("port");
        sender = context.getInitParameter("user");
        pass = context.getInitParameter("pass");
    }
 
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // reads form fields
    	
		Utente utente = (Utente) request.getSession().getAttribute(Costanti.USER_IN_SESSION);
		Auto auto = (Auto) request.getSession().getAttribute(Costanti.AUTO_IN_SESSION);
		Date dataInizioNoleggio = (Date) request.getSession().getAttribute(Costanti.DATA_INIZIO_NOLEGGIO);
		Date dataFineNoleggio = (Date) request.getSession().getAttribute(Costanti.DATA_FINE_NOLEGGIO);
		
		String dataRicevuta = new SimpleDateFormat("dd-MM-yyyy").format(new java.util.Date());

    	//String recipient = request.getParameter("recipient");
    
    	String recipient = utente.getUsername();
    	String subject = "Ricevuta prenotazione - Nolejava " + "(" + dataRicevuta + ")";
    	String content = "Gentile " + utente.getNome() + " " + utente.getCognome() + ", " + "\n"
    			+ "grazie per aver usato il nostro servizio di prenotazioni online. Per ritirare l'auto nel giorno di "
    			+ "ritiro prescelto, ti basterà presentare la ricevuta PDF in allegato in questa email."
    			+ "\n"
    			+ "\n"
    			+ "Ricorda che non sarà fatto nessun addebito automatico sulla tua carta di credito inserito e che il "
    			+ "pagamento per il tuo noleggio dovrà essere effettuato in sede il giorno del ritiro."
    			+ "\n"
    			+ "\n"
    			+ "Per qualsiasi altra informazione, siamo sempre a tua disposizione,"
    			+ "\n"
    			+ "\n"
    			+ "Cordiali saluti,"
    			+ "\n"
    			+ "lo STAFF di NoleJava";
        try {
            EmailWithPdfUtility.email(smtpHost, smtpPort, sender, pass, recipient, subject,
                    content, utente, auto, dataInizioNoleggio, dataFineNoleggio, dataRicevuta);
           
        } catch (Exception ex) {
            ex.printStackTrace();
            
        } finally {
            getServletContext().getRequestDispatcher("/jsp/privata/noleggioeffettuato.jsp").forward(
                    request, response);
        }
    }
}