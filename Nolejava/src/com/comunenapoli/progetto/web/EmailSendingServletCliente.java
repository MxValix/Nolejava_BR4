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
 

@WebServlet("/emailSendingServletCliente")
public class EmailSendingServletCliente extends HttpServlet {
  
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
    	String recipient = "";

    	
    	Boolean isCancellato = (Boolean) request.getAttribute(Costanti.CANCELLAZIONE_AVVENUTA);
    	Boolean registrazioneAvvenuta = (Boolean) request.getAttribute(Costanti.REGISTRAZIONE_AVVENUTA_EMAIL);
    	
        String subject = "";
        String content = "";
 
        String resultMessage = "";
        if (isCancellato!=null && isCancellato) {
        	recipient = request.getParameter("recipient");
        	subject = "NoleJava - Noleggio eliminato con successo";
        	content ="<html>\n" + 
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
            content = "Il tuo noleggio è stato cancellato";
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
            
        }
        
        if (registrazioneAvvenuta!=null && registrazioneAvvenuta) {
        	recipient = request.getParameter("email");
        	subject = "NoleJava - Registrazione avvenuta con successo";
        	content ="<html>\n" + 
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
            content += "Il tuo account è stato registrato con successo. A breve riceverai un' email da parte dello "
            		+ "staff di NoleJava per confermare la verifica del tuo account.";
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
        }
        
 
        try {
            EmailUtility.sendEmail(host, port, user, pass, recipient, subject,
                    content);
            resultMessage = "Operazione avvenuta con successo, controlla la tua casella postale";
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