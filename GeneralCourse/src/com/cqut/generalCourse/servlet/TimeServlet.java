package com.cqut.generalCourse.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cqut.generalCourse.service.TimeService;
import com.google.gson.Gson;

public class TimeServlet extends HttpServlet {

	TimeService timeService = new TimeService();
	Gson gson = new Gson();
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Map<String, String[]> params = request.getParameterMap();
		String method = params.get("method")[0];
		Map<String,Object> currentTime = new HashMap<String,Object>();
		switch(method){
			case "getCurrentTime":
				currentTime = timeService.getCurrentTime();break;
		}
		 
		String json = gson.toJson(currentTime);
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();  
        out.write(json);  
	}
}
