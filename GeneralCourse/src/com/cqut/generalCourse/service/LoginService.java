package com.cqut.generalCourse.service;

import java.util.List;
import java.util.Map;

import com.cqut.generalCourse.dao.CommonDAO;

public class LoginService {

	//保存CommonDAO对象
	public static CommonDAO dao = null;
	
	
	//在对象初始化时创建一个CommonDAO变量
	static{
		dao = new CommonDAO();
	}
	
	
	public List<Map<String,Object>> getUsers(){
		String sql=" select userId,userName,password from users ";
		return dao.executeQuery(sql, null);
	}
	
	
	
	
	
}
