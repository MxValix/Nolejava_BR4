package com.comunenapoli.progetto.web;

import java.io.IOException;
 
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comunenapoli.progetto.utils.Costanti;
import com.comunenapoli.progetto.utils.EmailUtility;
 

@WebServlet("/emailSendingServlet")
public class EmailSendingServlet extends HttpServlet {
  
	private static final long serialVersionUID = 1L;
	
	private String host;
    private String port;
    private String user;
    private String pass;
 
    public void init() {
        // reads SMTP server setting from web.xml file
        ServletContext context = getServletContext();
        host = context.getInitParameter("host");
        port = context.getInitParameter("port");
        user = context.getInitParameter("user");
        pass = context.getInitParameter("pass");
    }
 
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // reads form fields
    	String recipient = request.getParameter("recipient");
    	Boolean isPromosso = (Boolean) request.getAttribute(Costanti.UTENTE_PROMOSSO);
    	Boolean isRimosso = (Boolean) request.getAttribute(Costanti.UTENTE_RIMOSSO);
    	Boolean isVerificato = (Boolean) request.getAttribute(Costanti.UTENTE_VERIFICATO);
    	Boolean isCancellato = (Boolean) request.getAttribute(Costanti.CANCELLAZIONE_AVVENUTA);
    	
        String subject = "";
        String content = "";
 
        String resultMessage = "";
        if (isPromosso!=null && isPromosso) {
        	subject = "NoleJava - Account promosso";
        	content = "Sei stato promosso a membro dello staff. Congratulazioni";
            content += ", ora puoi effetuare il login. www.nolejava.com/login";

        }
        else if (isRimosso!=null && isRimosso) {
        	subject = "NoleJava - Account cancellato";
        	content = "Il tuo account è stato cancellato dai nostri sistemi.";
        }
        else if (isVerificato!=null && isVerificato) {
        	subject = "NoleJava - Account verificato con successo";
            content = "Il tuo account è stato verificato";
            content += ", ora puoi effetuare il login. www.nolejava.com/login";

        }
        else if (isCancellato!=null && isCancellato) {
        	subject = "NoleJava - Noleggio eliminato con successo";
            content = "Il tuo noleggio è stato cancellato";
        }
        
 
        try {
            EmailUtility.sendEmail(host, port, user, pass, recipient, subject,
                    content);
            resultMessage = "The e-mail was sent successfully";
        } catch (Exception ex) {
            ex.printStackTrace();
            resultMessage = "There were an error: " + ex.getMessage();
        } finally {
            request.setAttribute("Message", resultMessage);
            getServletContext().getRequestDispatcher("/jsp/result.jsp").forward(
                    request, response);
        }
    }
}