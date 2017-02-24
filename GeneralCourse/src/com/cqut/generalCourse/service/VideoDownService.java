package com.cqut.generalCourse.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.cqut.generalCourse.dao.CommonDAO;
import com.cqut.generalCourse.entity.JudgeNull;

//处理视频下载

public class VideoDownService {
	
	//保存CommonDAO对象
	public static CommonDAO dao = null;
	
	//在对象初始化时创建dao对象
	static{
		dao = new CommonDAO();
	}

	
	
	
	//获取视频地址
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public String getVideoAdress(String id){
		String sql ="select url from video where 1=1 ";
		ArrayList obj = new ArrayList();
		
		if(JudgeNull.isNull(id)){
			sql+=" and id = ? ";
			obj.add(Integer.parseInt(id));
		}
		
		//获取文件的url地址
		List<Map<String,Object>> res = dao.executeQuery(sql,obj.toArray());
		return (String)res.get(0).get("adressurl");
	}
	
	
}
