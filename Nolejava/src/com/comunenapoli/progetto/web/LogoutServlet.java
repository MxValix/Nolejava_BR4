package com.comunenapoli.progetto.web;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comunenapoli.progetto.utils.Costanti;


@WebServlet("/logoutServlet")
public class LogoutServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getSession().removeAttribute(Costanti.USER_IN_SESSION);
		String html = "/jsp/homepage.jsp";
		RequestDispatcher requestDispatcher; 
		requestDispatcher = request.getRequestDispatcher(html);
		requestDispatcher.forward(request, response);	
	}
}

