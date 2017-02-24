package com.cqut.generalCourse.servlet;

import java.io.IOException;
import java.io.Writer;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cqut.generalCourse.service.LoginService;
import com.google.gson.Gson;

public class LoginServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	//保存loginService变量
	public static LoginService loginService = null;
	public static Gson GSON =null;
	public static final String RANDOMCODEKEY = "RANDOMVALIDATECODEKEY";
	
	//在对象初始化时创建对象
	static{
		loginService = new LoginService();
		GSON = new Gson();
	}
	
	
	
	//处理get请求
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
//		doPost(req, resp);
	}

	
	
	//处理post请求
	@SuppressWarnings("rawtypes")
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		//设置编码格式
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		//保存写出流
		Writer out=null;
		
		try{
			//获取users 
			List<Map<String,Object>> list_map = loginService.getUsers();
			//获取writer对象
			out = resp.getWriter();
			
			String username=req.getParameter("username");
			String password=req.getParameter("password");
			int validecode = Integer.parseInt(req.getParameter("validecode"));
			
			
			//获取session对象
			HttpSession session = req.getSession();
			int valide = Integer.parseInt(session.getAttribute(RANDOMCODEKEY).toString());
			
			//查看验证码
			if(validecode!=valide)
			{
				out.write(GSON.toJson(1));
			}else{
				//便利集合
				for(int i =0;i<list_map.size();i++){
					
					Map map = list_map.get(i);
					
					//密码正确跳转到首页
					if(username.equals(map.get("userName"))&&password.equals(map.get("password"))){
						session.setAttribute("userId",map.get("userId"));
						session.setAttribute("username",username);
						session.setAttribute("password", password);
						resp.sendRedirect("admin/Index");
					}
				}
				 
			}
			 
		}catch(Exception e){
			e.printStackTrace();
			resp.sendRedirect("admin/login.jsp");
		}
		finally{
			out.write(GSON.toJson(2));
			out.flush();
			out.close();
		}
		
		 
		 
	}
	
	
	
	
	

}
