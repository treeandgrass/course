package com.cqut.generalCourse.service;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.cqut.generalCourse.dao.CommonDAO;

public class TimeService {

	public CommonDAO cd = new CommonDAO();
	//获取当前时间
	public Map<String,Object> getCurrentTime(){
		Map<String,Object> map = new HashMap<String,Object>();
		Date date=new Date();
		map.put("year", date.getYear() + 1900);
		map.put("month", date.getMonth() + 1);
		map.put("date", date.getDate());
		map.put("hour", date.getHours() < 10?"0" + date.getHours():date.getHours());
		map.put("minute", date.getMinutes() < 10?"0" + date.getMinutes():date.getMinutes());
		map.put("second", date.getSeconds() < 10?"0" + date.getSeconds():date.getSeconds());
		
		return map;
	}
}
