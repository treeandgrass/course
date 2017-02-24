package com.cqut.generalCourse.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cqut.generalCourse.service.IndexRequestService;
import com.google.gson.Gson;

public class IndexRequestServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	//deal get request
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req,resp);
	}
	
	
	//deal post request
	@SuppressWarnings("rawtypes")
	@Override
	protected void doPost(HttpServletRequest req,HttpServletResponse resp) 
			throws ServletException,IOException{
		try{
			IndexRequestService rqService = new IndexRequestService();
			Gson GSON = new Gson();
			
			List<Map<String,Object>> list_Map = null;
			String mdName = req.getParameter("method");
			String params = req.getParameter("params");
			Map paramsMap=GSON.fromJson(params,Map.class);
			switch(mdName){
			
				case "getColumnData":
						list_Map = rqService.getColumnData(paramsMap);
					break;
			
				case "getLeftData":
						list_Map = rqService.getLeftData(paramsMap);
					break;
				
				case "leftIndexTitle":
					list_Map = rqService.getLeftIndexTitle(paramsMap);
					break;
				
				default:
					break;
			}
			
			
			resp.setContentType("text/html;charset=utf-8");
			resp.getWriter().write(new Gson().toJson(list_Map));
		
		
		}
		catch( Exception e){
			e.printStackTrace();
		}
	}
	
}
