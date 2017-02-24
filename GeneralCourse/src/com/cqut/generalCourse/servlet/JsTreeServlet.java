package com.cqut.generalCourse.servlet;

import java.io.Writer;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cqut.generalCourse.service.JsTreeService;
import com.google.gson.Gson;

public class JsTreeServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	//����get����
	@Override
	protected void doGet(HttpServletRequest req,HttpServletResponse resp){
		//��get������post������
		doPost(req,resp);
	}
	
	//����post����
	@Override
	protected void doPost(HttpServletRequest req,HttpServletResponse resp){
		try{
			String mdName = req.getParameter("method");
			
			JsTreeService jsService = new JsTreeService();
			Gson GSON = new Gson();
			Writer out = resp.getWriter();
			List<Map<String,Object>> list_Map =null;
			
			switch(mdName){
				case "sysController":
					list_Map=jsService.getSysData();
					break;
					
				case "webController":
					list_Map=jsService.getWebData();
					break;
					
				default:
					break;
			}
			
			//���õ���ݷ���
			out.write(GSON.toJson(list_Map));
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}

}
