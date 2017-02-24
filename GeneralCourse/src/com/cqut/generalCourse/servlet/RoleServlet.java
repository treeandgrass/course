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

import com.cqut.generalCourse.service.ArticleService;
import com.cqut.generalCourse.service.RoleService;
import com.google.gson.Gson;

public class RoleServlet extends HttpServlet {
private static final long serialVersionUID = 1L;
	
	RoleService roleService = new RoleService();
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
					case "getRoles":
						result = roleService.getRoles();
						break;
					case "getRoleById":
						Long roleId = Long.parseLong(params.get("roleId")[0]);
						result = roleService.getRoleById(roleId);
						break;
					case "roleAdd":
						String roleAdd = params.get("role")[0];
						Map addRole = gson.fromJson(roleAdd, Map.class);
						result = roleService.addRole(addRole);
						break;
					case "deleteRoleById":
						Long id = Long.parseLong(params.get("id")[0]);
						result = roleService.deleteRoleById(id);
						break;
					case "roleEdit":
						String roleEdit = params.get("role")[0];
						Map editRole = gson.fromJson(roleEdit, Map.class);
						result = roleService.editRole(editRole);
						break;
				}
				 
				String json = gson.toJson(result);
				
				System.out.println(json);
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();  
		        out.write(json);  
	}
}
