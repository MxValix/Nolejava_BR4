package com.comunenapoli.progetto.web;

import java.io.IOException; 

import javax.servlet.Filter; 
import javax.servlet.FilterChain; 
import javax.servlet.FilterConfig; 
import javax.servlet.ServletException; 
import javax.servlet.ServletRequest; 
import javax.servlet.ServletResponse; 
import javax.servlet.annotation.WebFilter; 
import javax.servlet.http.HttpServletRequest;

import com.comunenapoli.progetto.model.Utente;
import com.comunenapoli.progetto.utils.Costanti; 


@WebFilter(urlPatterns = {"/jsp/private/*"}) 
public class FiltroAccessiDashboard implements Filter { 

	@Override 
	public void destroy() { 
	} 

	@Override 
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException { 
		HttpServletRequest httpServletRequest = (HttpServletRequest) request; 
		Utente utenteLoggato = (Utente) httpServletRequest.getSession().getAttribute(Costanti.USER_IN_SESSION); 
		if ( utenteLoggato != null) { 
			Integer idRuolo = utenteLoggato.getRuolo().getId();

			if (!(idRuolo == Costanti.ID_RUOLO_CLIENTE)) {
				chain.doFilter(request, response); 
			}
			else {
				request.getRequestDispatcher("/jsp/privata/profilocliente.jsp").forward(request,response); 	
			}
		} 
		else { 
			request.getRequestDispatcher("/jsp/login.jsp").forward(request,response); 
		}
	} 

	@Override 
	public void init(FilterConfig filterConfig) throws ServletException { 
	} 

}