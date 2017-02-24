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
import com.cqut.generalCourse.service.PermissionService;
import com.google.gson.Gson;

public class PermissionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	PermissionService permissionService = new PermissionService();
	Gson gson = new Gson();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// TODO Auto-generated method stub
				Map<String, String[]> params = request.getParameterMap();
				String method = params.get("method")[0];
				List<Map<String,Object>> result = new ArrayList<Map<String,Object>>();
				switch(method){
					case "addPermission":
						String addPermissionStr = params.get("permission")[0];
						Map addPermission = gson.fromJson(addPermissionStr, Map.class);
						result = permissionService.addPermission(addPermission);
						break;
					case "deletePermission":
						String deletePermissionStr = params.get("permission")[0];
						Map deletePermission = gson.fromJson(deletePermissionStr, Map.class);
						result = permissionService.deletePermission(deletePermission);
						break;
				}
				 
				String json = gson.toJson(result);
				
				System.out.println(json);
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();  
		        out.write(json);  
	}
}
