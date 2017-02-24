package com.cqut.generalCourse.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cqut.generalCourse.entity.Users;
import com.cqut.generalCourse.service.TimeService;
import com.cqut.generalCourse.service.UserService;
import com.google.gson.Gson;

public class UserServlet extends HttpServlet  {


	UserService userService = new UserService();
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
			case "getCurrentUser":
				result = userService.getUserById(Long.parseLong(request.getSession().getAttribute("userId").toString()));
				break;
			case "getTeamers":
				result = userService.getTeamers();
				break;
			case "getUsers":
				String selectDatas = params.get("params")[0];
				Map datas = gson.fromJson(selectDatas, Map.class);
				result = userService.getUsersByParams(datas);
				break;
			case "getUserById":
				Long userId = Long.parseLong(params.get("userId")[0]);
				result = userService.getUserById(userId);
				break;
			case "userAdd":
				String userAdd = params.get("user")[0];
				Map addUser = gson.fromJson(userAdd, Map.class);
				result = userService.addUser(addUser);
				break;
			case "deleteUserById":
				Long id = Long.parseLong(params.get("id")[0]);
				result = userService.deleteUserById(id);
				break;
			case "userEdit":
				String userEdit = params.get("user")[0];
				Map editUser = gson.fromJson(userEdit, Map.class);
				result = userService.editUser(editUser);
				break;
		}
		 
		String json = gson.toJson(result);
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();  
        out.write(json);
	}
}
