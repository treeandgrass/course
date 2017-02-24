package com.cqut.generalCourse.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.cqut.generalCourse.dao.CommonDAO;
import com.cqut.generalCourse.entity.JudgeNull;
import com.cqut.generalCourse.entity.TranslateToInt;

/**
 * 
 * @author my
 *请求内容介绍
 */
public class ContentService {
	
	//保存CommoDAO对象
	public static CommonDAO dao = null;
	
	
	
	//在对象初始化时创建CommonDAO对象
	static{
		dao = new CommonDAO();
	}
	
	
	
	//获取文章表的内容
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<Map<String,Object>> getContent(Map params){
		
		ArrayList obj = new ArrayList();
		String sql=" select content from article where 1=1 ";
		
		if(JudgeNull.isNull(params.get("columnId"))){
			sql+=" and columnId= ? ";
			obj.add(TranslateToInt.getInterger(params.get("columnId")));
		}
		
		
		return dao.executeQuery(sql,obj.toArray());
	}
	
	
	//获取文章动态
	public List<Map<String,Object>> getCourseDynamic(){
		String sql=" select articleId,title,publishTime, userName "
				+ "  from article A left join users B on A.userId =B.userId ";
		return dao.executeQuery(sql,null);
	}
	
	
	//教学课件展示
	public List<Map<String,Object>> getCourseWare(){
		String sql=" select id,title,introduce,publishedTime,url from file where judgeId=1 ";
		return dao.executeQuery(sql,null);
	}
	
	//获取视频介绍
	public List<Map<String,Object>> getVideoList(){
		String sql=" select id,title,introduce,publishedTime,url from file where judgeId=0 ";
		return dao.executeQuery(sql, null);
	}
	
	
	//获取video页面详情数据
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<Map<String,Object>> getDetailPage(Map params){
		
		String sql = "  select id,url,title , publishedtime ,userName,downurl,details ,adressurl,judgeId  from ( select id,title , "
						+ "  pictureId,publishedtime ,userName, downurl,details,adressurl,judgeId from file A left join users B on A.userId "
						+ "	= B.userId where 1=1  ";
						
		ArrayList obj = new ArrayList();
		if(JudgeNull.isNull(params.get("id"))){
			sql+="  and id= ?";
			obj.add(TranslateToInt.getInterger(params.get("id")));
		}
		
		sql+=" ) C left join picture D on C.pictureId = D.pictureId ";
		
		return dao.executeQuery(sql,obj.toArray());
		
	}
	
	
	//获取课程动态详情详情页面
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<Map<String,Object>> getArticleDetail(Map params){
		
		String sql=" select title,content,publishTime,userName ,url from  (select pictureId, "
				+ " title,content,publishTime,userName from ( select articleId, title,content,publishTime,userName from article A left join users B on "
				+" A.userId = B.userId where 1=1   ";
				
		ArrayList obj = new ArrayList();
		
		if(JudgeNull.isNull(params.get("articleId"))){
			sql+=" and articleId= ? ";
			obj.add(TranslateToInt.getInterger(params.get("articleId")));
		}
		
		sql+= " ) C left join article_picture D on C.articleId = D.articleId) E "
				+" left join picture F on E.pictureId = E.pictureId";
		
		return dao.executeQuery(sql, obj.toArray());
	}
	

	
}
