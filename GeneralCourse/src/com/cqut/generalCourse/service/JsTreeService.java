package com.cqut.generalCourse.service;

import java.util.List;
import java.util.Map;

import com.cqut.generalCourse.dao.CommonDAO;

/**
 * 
 * @author my
 */
public class JsTreeService {
	
	//����CommonDAO���
	public static CommonDAO dao = null;
	
	static{
		dao = new CommonDAO();
	}
	
	public List<Map<String,Object>> getSysData(){
		String sql="select *from module";
		List<Map<String,Object>> li=dao.executeQuery(sql, null);
//		List<Map<String>>
		
		
		return null;
	}
	
	public List<Map<String,Object>> getWebData(){
		return null;
	}

}
