package com.cqut.generalCourse.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.cqut.generalCourse.dao.CommonDAO;
import com.cqut.generalCourse.entity.JudgeNull;
import com.cqut.generalCourse.entity.TranslateToInt;

/**
 * 
 * 
 * @author 
 * ����indexApp������
 *
 */
public class IndexRequestService {
	
	//����DAO��Ķ���
	CommonDAO dao =null;
	
	public IndexRequestService(){
		dao = new CommonDAO();
	}
	
	//��ȡ��̨����Ŀ������
	@SuppressWarnings("rawtypes")
	public List<Map<String,Object>> getColumnData(Map params){
		String sql ="select  *from columns where upId is null ";
		return dao.executeQuery(sql,new Object[0]);
	}
	
	//��ȡ��ҳ���������Ĵ���
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<Map<String,Object>> getLeftData(Map params){
		String sql="select *from columns where 1=1";
		ArrayList obj = new ArrayList();
		
		if(JudgeNull.isNull(params.get("columnId"))){
			sql+=" and Upid = ?";
			obj.add(TranslateToInt.getInterger(params.get("columnId")));
		}
		
		return dao.executeQuery(sql,obj.toArray());
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<Map<String,Object>> getLeftIndexTitle(Map params){
		String sql="select columnName from  columns";
		ArrayList obj = new ArrayList();
		
		if(JudgeNull.isNull(params.get("columnId"))){
			sql+="  where columnId=?";
			obj.add(TranslateToInt.getInterger((params.get("columnId"))));
		}
		
		return dao.executeQuery(sql,obj.toArray());
	}
	
	//获取栏目表文章
	
}
