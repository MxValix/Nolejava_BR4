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
    	String content ="<html>\n" + 
    			"<style type=\"text/css\">\n" + 
    			"body{background-color: #88BDBF;margin: 0px;}\n" + 
    			"</style>\n" + 
    			"<body>\n" + 
    			"	<table border=\"0\" width=\"50%\" style=\"margin:auto;padding:30px;background-color: #F3F3F3;border:1px solid #f7b71d;\">\n" + 
    			"		<tr>\n" + 
    			"			<td>\n" + 
    			"				<table border=\"0\" width=\"100%\">\n" + 
    			"					<tr>\n" + 
    			"						<td>\n" + 
				"							<h1><a href=\"http://localhost:8080/Nolejava/\"><img src=\"https://i.ibb.co/HtBghxc/logo-pdf.png\" alt=\"logo-pdf\" border=\"0\"></a></h1></td>\n" + 
    			"						<td>\n" + 
    			"						</td>\n" + 
    			"					</tr>\n" + 
    			"				</table>\n" + 
    			"			</td>\n" + 
    			"		</tr>\n" + 
    			"		<tr>\n" + 
    			"			<td>\n" + 
    			"				<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"text-align:center;width:100%;background-color: #fff;\">\n" + 
    			"					<tr>\n" + 
    			"						<td style=\"background-color:#f7b71d;height:100px;font-size:20px;color:#fff;\"><h3 style=\"padding-top:25px;\">" + subject + "</h3></td>\n" + 
    			"					</tr>\n" + 
    			"					<tr>\n" + 
    			"						<td>\n" + 
    			"						</td>\n" + 
    			"					</tr>\n" + 
    			"					<tr>\n" + 
    			"						<td>\n" + 
    			"							<p style=\"padding:0px 100px;\">";
    	content += "Gentile " + utente.getNome() + " " + utente.getCognome() + ", " + "\n"
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
    	content += "</p>\n" + 
    			"						</td>\n" + 
    			"					</tr>\n" + 
    			"					<tr>\n" + 
    			"						<td>\n" + 
    			"							<button onclick=\"location.href='http://localhost:8080/Nolejava/jsp/login.jsp'\" style=\"margin:10px 0px 30px 0px;border-radius:4px;padding:10px 20px;border: 0;color:#fff;background-color:#f7b71d; \">Accedi adesso</button>\n" + 
    			"						</td>\n" + 
    			"					</tr>\n" + 
    			"				</table>\n" + 
    			"			</td>\n" + 
    			"		</tr>\n" + 
    			"		<tr>\n" + 
    			"			<td>\n" + 
    			"				<table border=\"0\" width=\"100%\" style=\"border-radius: 5px;text-align: center;\">\n" + 
    			"					<tr>\n" + 
    			"						<td>\n" + 
    			"							<h3 style=\"margin-top:10px;\"></h3>\n" + 
    			"						</td>\n" + 
    			"					</tr>\n" + 
    			"\n" + 
    			"					<tr>\n" + 
    			"						<td>\n" + 
    			"							<div style=\"margin-top: 20px;\">\n" + 
    			"								<span style=\"font-size:12px;\">Breakout Room 4</span><br>\n" + 
    			"								<span style=\"font-size:12px;\">Copyright © 2020 Nolejava</span>\n" + 
    			"							</div>\n" + 
    			"						</td>\n" + 
    			"					</tr>\n" + 
    			"				</table>\n" + 
    			"			</td>\n" + 
    			"		</tr>\n" + 
    			"	</table>\n" + 
    			"</body>\n" + 
    			"</html>";	
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