package com.cqut.generalCourse.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.cqut.generalCourse.service.ColumnService;

public class ColumnServlet extends HttpServlet {


	ColumnService columnService = new ColumnService();
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
		List<Map<String,Object>> result = new ArrayList<Map<String,Object>>();
		switch(method){
			case "getColumnById":
				Long columnId = Long.parseLong(params.get("columnId")[0]);
				result = columnService.getColumnById(columnId);
				break;
			case "getAllColumn":
				result = columnService.getAllColumn();
				break;
			case "getOneLevelColumns":
				result = columnService.getOneLevelColumns();
				break;
			case "getTwoLevelColumns":
				result = columnService.getTwoLevelColumns();
				break;
			case "columnAdd":
				String columnAdd = params.get("column")[0];
				Map addColumn = gson.fromJson(columnAdd, Map.class);
				result = columnService.addColumn(addColumn);
				break;
			case "deleteColumnById":
				Long id = Long.parseLong(params.get("id")[0]);
				result = columnService.deleteColumnById(id);
				break;
			case "columnEdit":
				String columnEdit = params.get("column")[0];
				Map editColumn = gson.fromJson(columnEdit, Map.class);
				result = columnService.editColumn(editColumn);
				break;
		}
		 
		String json = gson.toJson(result);
		
		System.out.println(json);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();  
        out.write(json);  
	}
}
