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
import com.cqut.generalCourse.service.ModuleService;

public class ModuleServlet extends HttpServlet {


	ModuleService moduleService = new ModuleService();
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
			case "getModuleById":
				Long moduleId = Long.parseLong(params.get("moduleId")[0]);
				result = moduleService.getModuleById(moduleId);
				break;
			case "getAllModule":
				result = moduleService.getAllModule();
				break;
			case "getModulesByCurrentUser":
				String userId = params.get("id")[0];
				result = moduleService.getModulesByCurrentUser(userId);
				break;
			case "getOneLevelModules":
				result = moduleService.getOneLevelModules();
				break;
			case "moduleAdd":
				String moduleAdd = params.get("module")[0];
				Map addModule = gson.fromJson(moduleAdd, Map.class);
				result = moduleService.addModule(addModule);
				break;
			case "deleteModuleById":
				Long id = Long.parseLong(params.get("id")[0]);
				result = moduleService.deleteModuleById(id);
				break;
			case "moduleEdit":
				String moduleEdit = params.get("module")[0];
				Map editModule = gson.fromJson(moduleEdit, Map.class);
				result = moduleService.editModule(editModule);
				break;
		}
		 
		String json = gson.toJson(result);
		
		System.out.println(json);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();  
        out.write(json);  
	}
}
