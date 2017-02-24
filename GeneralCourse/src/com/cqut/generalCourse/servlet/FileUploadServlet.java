package com.cqut.generalCourse.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


public class FileUploadServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req,HttpServletResponse resp) 
			throws ServletException,IOException{
		//调用doPost方法处理get请求
		doPost(req,resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//判断是否是为文件上传
		req.setCharacterEncoding("UTF-8");
		boolean isMultipart = ServletFileUpload.isMultipartContent(req);
		if(isMultipart){
			File f =new File("G:/Video");
			if(!f.exists()){
				f.mkdirs();
			}
			
			DiskFileItemFactory factory = new DiskFileItemFactory(1048576,f);
			ServletFileUpload upload = new ServletFileUpload(factory);
			
			try {
				List<FileItem> items = upload.parseRequest(req);
				Iterator<FileItem> iter = items.iterator();
				while (iter.hasNext()) {
				    FileItem item = iter.next();
				    
				    if (item.isFormField()) {
				    	 String name = item.getFieldName();
				    	 String value = item.getString();
				    	 System.out.println("formFiled:"+name+" ,"+value);
				    	 
				    } else {
				        String fileName = item.getName();
				        fileName="G://file//"+fileName;
				        File file = new File(fileName);
				        InputStream in = item.getInputStream();
				        FileOutputStream out = new FileOutputStream(file);
				        
				        //写文件
				        int i =0;
				        byte[] buffer = new byte[1024];
				        while(-1!=(i=in.read(buffer))){
				        	out.write(buffer,0,i);
				        }
				        in.close();
				        out.flush();
				        out.close();
				        		
				    }
			   }
				
				
			} catch (FileUploadException e) {
				e.printStackTrace();
			}
		}
		
	}

}
