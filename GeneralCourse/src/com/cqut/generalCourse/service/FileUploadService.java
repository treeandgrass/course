package com.cqut.generalCourse.service;

import com.cqut.generalCourse.dao.CommonDAO;

public class FileUploadService {
	
	//保存Dao层对象
	public static CommonDAO dao = null;
	
	//在对象初始化时创建一个CommonDAO对象
	static{
		dao = new CommonDAO();
	}
	
	//处理文件字段对象
	public void dealFileFiled(){
		
	}
	
	//处理保存文件返回路径
	public String SaveFile(){
		return null;
	}
	
}
