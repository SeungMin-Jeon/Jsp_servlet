package org.galapagos.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.galapagos.command.Command;
import org.galapagos.command.DetailCommand;
import org.galapagos.command.ListCommand;

/**
 * Servlet implementation class FrontControlServlet
 */
@WebServlet("*.do")
public class FrontControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	Map<String, Command> commandMap = new HashMap<>();
	String prefix = "views/"; 	// view 이름의 접두어
	String surfix= ".jsp";	// view 이름의 접미어
	
	public FrontControllerServlet() {
		commandMap.put("/list.do", new ListCommand());
		commandMap.put("/detail.do", new DetailCommand());
	}
	
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
				
		System.out.print(request);
		
		Command cmd = commandMap.get(command.toString());
		String view;
		
		if(cmd != null) {
			view = cmd.execute(request, response); // 이동할 JSP의 경로
		} else { // cmd가 null일 경우는 404 에러 상황이다.
			view = "404";
		}
		
		String target = prefix + view + surfix;
		// view로 forwarding
		RequestDispatcher dis = request.getRequestDispatcher(target);
		dis.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
