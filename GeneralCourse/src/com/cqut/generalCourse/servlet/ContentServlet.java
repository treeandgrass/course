package com.cqut.generalCourse.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cqut.generalCourse.service.ContentService;
import com.google.gson.Gson;

public class ContentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	//保存ContentService的对象
	public static ContentService contentService= null;
	public static Gson GSON = null;
	
	
	//在对象初始化时创建ContentService对象
	static{
		contentService = new ContentService();
		GSON = new Gson();
	}
	
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//将请求交与Post处理
		doPost(req,resp);
	}

	
	
	
	@SuppressWarnings("rawtypes")
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		List<Map<String,Object>> list_Map = null;
		try{
			
			String mdName = req.getParameter("method");
			String params = req.getParameter("params");
			Map paramsMap=GSON.fromJson(params,Map.class);
			
			//使请求分流
			switch(mdName){
		 
			case "articleContent":
				list_Map=contentService.getContent(paramsMap);
				break;
			
			case "courseDynamic":
				list_Map = contentService.getCourseDynamic();
				break;
			
			case "courseware":
				list_Map=contentService.getCourseWare();
				break;
			
			case "coursevideo":
				list_Map=contentService.getVideoList();
				break;
				
			case "detailPage":
				list_Map=contentService.getDetailPage(paramsMap);
				break;
				
			case "articledetail":
				list_Map = contentService.getArticleDetail(paramsMap);
				break;
				
			default:
				break;
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		//将数据写回前台
		resp.setContentType("text/html;charset=utf-8");
		resp.getWriter().write(new Gson().toJson(list_Map));
		
	}
	
	

}
