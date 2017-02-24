package com.cqut.generalCourse.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cqut.generalCourse.dao.CommonDAO;
import com.cqut.generalCourse.entity.Users;

public class ArticleService {

	public CommonDAO cd = new CommonDAO();
	//根据id获取文章
	public List<Map<String,Object>> getArticleById(Long id){
		String sql = "select * from article left join columns on article.columnId = columns.columnId where articleId = ?";
		List<Map<String,Object>> list = cd.executeQuery(sql, new Object[]{id});
		for(int i = 0;i < list.size();i++){
			Map<String,Object> article = list.get(i);
			if(article.get("deadLine") != null)
				article.put("deadLine", article.get("deadLine").toString().substring(0, 10));
		}
		
		return list;
	}
	//根据栏目获取已发表文章，用于前台展示
	public List<Map<String,Object>> getPublishArticlesByColumnId(String columnId){
		String sql = "select * from article where columnId = ? and status in (3) order by publishTime DESC limit 0,10";
		
		List<Map<String,Object>> list = cd.executeQuery(sql, new Object[]{columnId});
		for(int i = 0;i < list.size();i++){
			Map<String,Object> article = list.get(i);
			article.put("publishTime",article.get("publishTime").toString().substring(0, 10));
		}
		return list;
	}
	//根据参数获取文章
	public List<Map<String,Object>> getArticlesByParams(Map<String,Object> params){
		List<Object> datas = new ArrayList<Object>();
		String sql = "select * from article"
				+ " left join columns on article.columnId = columns.columnId"
				+ " left join users on article.userId = users.userId where 1=1 ";
		//添加搜索参数
		if(params.get("articleName") != null && !params.get("articleName").equals("")){
			sql += " and article.title like ?";
			datas.add("%" + params.get("articleName") + "%");
		}
		if(params.get("columnId") != null && !params.get("columnId").equals("")){
			sql += " and (article.columnId = ? or columns.upid = ?)";
			datas.add(params.get("columnId"));
			datas.add(params.get("columnId"));
		}
		if(params.get("selectPublishTimeStart") != null && !params.get("selectPublishTimeStart").equals("")){
			//即使限定了发表时间范围也能搜索到为空项，下同
			sql += " and (article.publishTime >= ? or article.publishTime is null)";
			datas.add(params.get("selectPublishTimeStart") + " 00:00:00");
		}
		if(params.get("selectPublishTimeEnd") != null && !params.get("selectPublishTimeEnd").equals("")){
			sql += " and (article.publishTime <= ? or article.publishTime is null)";
			datas.add(params.get("selectPublishTimeEnd") + " 23:59:59");
		}
		if(params.get("selectScanCountStart") != null && !params.get("selectScanCountStart").equals("")){
			sql += " and article.scanCount >= ?";
			datas.add(params.get("selectScanCountStart"));
		}
		if(params.get("selectScanCountEnd") != null && !params.get("selectScanCountEnd").equals("")){
			sql += " and article.scanCount <= ?";
			datas.add(params.get("selectScanCountEnd"));
		}
		if(params.get("selectAuthor") != null && !params.get("selectAuthor").equals("")){
			sql += " and users.userName like ?";
			datas.add("%" + params.get("selectAuthor") + "%");
		}
		if(params.get("selectStatus") != null && !params.get("selectStatus").equals("")){
			sql += " and article.status = ?";
			datas.add(params.get("selectStatus"));
		}
		if(params.get("selectDeadLineStart") != null && !params.get("selectDeadLineStart").equals("")){
			sql += " and (article.deadLine >= ? or article.deadLine is null)";
			datas.add(params.get("selectDeadLineStart") + " 00:00:00");
		}
		if(params.get("selectDeadLineEnd") != null && !params.get("selectDeadLineEnd").equals("")){
			sql += " and (article.deadLine <= ? or article.deadLine is null)";
			datas.add(params.get("selectDeadLineEnd") + " 23:59:59");
		}
		UserService userService = new UserService();
		Map<String,Object> user = userService.getUserById(Long.parseLong(params.get("currentUserId").toString())).get(0);
		//不是管理员则只能查看自己的文章
		if(user.get("roleId") != null && Long.parseLong(user.get("roleId").toString()) != 1){
			sql += " and article.userId = ?";
			datas.add(user.get("userId"));
		}
		
		sql += " order by publishTime DESC";
		List<Map<String,Object>> list = cd.executeQuery(sql, datas.toArray());
		for(int i = 0;i < list.size();i++){
			Map<String,Object> article = list.get(i);
			if(article.get("publishTime") != null)
				article.put("publishTime", article.get("publishTime").toString().substring(0, 19));
			if(article.get("deadLine") != null)
				article.put("deadLine", article.get("deadLine").toString().substring(0, 19));
		}
		
		return list;
	}
	//添加文章
	public List<Map<String,Object>> addArticle(Map<String,Object> article){
		List<Map<String,Object>> result = new ArrayList<Map<String,Object>>();
		Map<String,Object> resultMap = new HashMap<String,Object>();
		result.add(resultMap);
		boolean isOK = true;
		String insertSql1 = "insert into article(title,content,columnId,userId,status,scanCount";
		String insertSql2 = ") values(?,?,?,?,?,?";
		ArrayList<Object> list = new ArrayList<Object>();
		//检查标题
		String name = article.get("articleName").toString();
		list.add(name);
		if(name==null || name.equals("")){
			resultMap.put("nameMessage", "文章标题不能为空");
			isOK = false;
		}
		//检查内容
		String content = article.get("content").toString();
		list.add(content);
		if(content==null || content.equals("")){
			resultMap.put("contentMessage", "文章内容不能为空");
			isOK = false;
		}
		//检查栏目
		String columnId = article.get("columnId").toString();
		list.add(new Double(columnId).intValue());
		if(columnId==null || columnId.equals("")){
			resultMap.put("columnMessage", "所属栏目不能为空");
			isOK = false;
		}
		//添加上传者，状态，浏览次数
		list.add(article.get("userId"));
		list.add(1);
		list.add(0);
		//检查截止时间
		if(!article.get("deadLine").equals("")){
			String deadLine = article.get("deadLine").toString();
			insertSql1 += (",deadLine" + insertSql2 + ",?)");
			list.add(deadLine);
		}
		else{
			insertSql1 += (insertSql2 + ")");
		}
		if(isOK){
			//保存到数据库
			int updateCount = cd.executeUpdate(insertSql1, list.toArray());
			//等于1 表示添加成功
			if(updateCount==1){
				resultMap.put("success", "1");
			}else{
				resultMap.put("addMessage", "新增失败");
			}
		}
		return result;
	}
	//删除
	public List<Map<String,Object>> deleteArticleById(Long id){
		int result = 0;
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		Map<String,Object> map = new HashMap<String,Object>();
		list.add(map);
		try{
			String sql = "delete from article where articleId = ?";
			result = cd.executeUpdate(sql, new Object[]{id});
		}
		catch(Exception ex){
			result = 0;
		}
		list.get(0).put("result", result);
		return list;
	}
	//修改
	public List<Map<String,Object>> editArticle(Map<String,Object> article){
		List<Map<String,Object>> result = new ArrayList<Map<String,Object>>();
		Map<String,Object> resultMap = new HashMap<String,Object>();
		result.add(resultMap);
		String updateSql = "update article set title = ?,content = ?,columnId = ?";
		ArrayList<Object> list = new ArrayList<Object>();
		boolean isOK = true;
		//检查标题
		String name = article.get("title").toString();
		list.add(name);
		if(name==null || name.equals("")){
			resultMap.put("nameMessage", "文章标题不能为空");
			isOK = false;
		}
		//检查内容
		String content = article.get("content").toString();
		list.add(content);
		if(content==null || content.equals("")){
			resultMap.put("contentMessage", "文章内容不能为空");
			isOK = false;
		}
		//检查栏目
		Object columnId = article.get("columnId");
		if(columnId==null || columnId.equals("")){
			resultMap.put("columnMessage", "所属栏目不能为空");
			isOK = false;
		}
		else{
			list.add(new Double(columnId.toString()).intValue());
		}
		//检查截止时间
		Object deadLine = article.get("deadLine");
		if(deadLine != null){
			list.add(deadLine);
			updateSql += ",deadLine = ?";
		}
		
		Long articleId = new Double(article.get("articleId").toString()).longValue();
		list.add(articleId);
		updateSql += " where articleId = ?";
		
		if(isOK){
			//保存到数据库
			int updateCount = cd.executeUpdate(updateSql, list.toArray());
			//等于1 表示添加成功
			if(updateCount==1){
				resultMap.put("success", 1);
				resultMap.put("editMessage", "修改成功");
			}else{
				resultMap.put("editMessage", "修改失败");
			}
			
		}
		return result;
	}
	
	//审核文章
	public List<Map<String,Object>> review(Long id,String status){
		int review = 0;
		List<Map<String,Object>> result = new ArrayList<Map<String,Object>>();
		Map<String,Object> map = new HashMap<String,Object>();
		result.add(map);
		List<Object> params = new ArrayList<Object>();
		String sql = "update article set status = ?";
		params.add(status);
		//通过则添加发表时间
		if(status.equals("3")){
			sql += ",publishTime = ?";
			params.add(new Date());
		}
		try{
			sql += " where articleId = ?";
			params.add(id);
			review = cd.executeUpdate(sql, params.toArray());
		}
		catch(Exception ex){
			review = 0;
		}
		result.get(0).put("success", review);
		return result;
	}
}
