package com.cqut.generalCourse.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cqut.generalCourse.service.VideoDownService;
import com.google.gson.Gson;

public class FileDownload extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	//保存VideoDownService对象
	public static VideoDownService videoService = null;
	public static Gson GSON = null;
	
	//在对象加载进入内存时创建对象
	static{
		videoService = new VideoDownService();
		GSON = new Gson();
	}
	
	
	
	//处理get请求
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	
	
	//处理post请求
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		//保存流对象
		FileInputStream input = null;
		OutputStream out=null;
		
		try{
			
			//获取前台参数
			String adressurl = req.getParameter("adressurl");
			//Map paramsMap=GSON.fromJson(params,Map.class);
			//String url = videoService.getVideoAdress(param);
			
			//获取文件名
			String[] arr = adressurl.split("/");
			String filename = arr[arr.length-1];
			
			//设置返回对象
			resp.setContentType(getServletContext().getMimeType(filename));
			resp.setHeader("Content-Disposition","attachment;filename="+filename);
			
			//读文件写入前台
			out = resp.getOutputStream();
			int c=0;
			
			
			File f =new File(adressurl);
			input = new FileInputStream(f);
			byte[] buffer = new byte[1024];
			
			while(-1!=(c=input.read(buffer))){
				out.write(buffer,0,c);
			}
			
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			input.close();
			out.flush();
			out.close();
		}
		
	}
	
	
	

}
