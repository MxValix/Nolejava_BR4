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

/**
 * Servlet implementation class EmailSendingServletContacts
 */
@WebServlet("/emailSendingServletContacts")
public class EmailSendingServletContacts extends HttpServlet {
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
    	String recipient = "nolejava.amministratore@gmail.com";
    	
        String subject = request.getParameter("oggetto");
        
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String messaggio = request.getParameter("messaggio");
        
        String content = "Nome: " + nome + " - " + "Email: " + email + "\n" +  "\n" + messaggio;

 
        String resultMessage = "";
        
 
        try {
            EmailUtility.sendEmail(host, port, user, pass, recipient, subject,
                    content);
            resultMessage = "L'email è stata inviata correttamente, grazie per averci contattato";
        } catch (Exception ex) {
            ex.printStackTrace();
            resultMessage = "There were an error: " + ex.getMessage();
        } finally {
            request.setAttribute("Message", resultMessage);
            getServletContext().getRequestDispatcher("/jsp/contact.jsp").forward(
                    request, response);
        }
    }
}