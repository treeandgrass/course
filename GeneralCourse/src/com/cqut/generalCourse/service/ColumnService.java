package com.cqut.generalCourse.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cqut.generalCourse.dao.CommonDAO;

public class ColumnService {

	public CommonDAO cd = new CommonDAO();
	//用id搜索
	public List<Map<String,Object>> getColumnById(Long id){
		String sql = "select * from columns where columnId = ?";
		return cd.executeQuery(sql, new Object[]{id});
	}
	//获取所有
	public List<Map<String,Object>> getAllColumn(){
		
		String sql = "select secondLevel.*,oneLevel.columnName as upColumnName "
				+ "from columns as secondLevel "
				+ "left join columns as oneLevel on secondLevel.upid = oneLevel.columnId"
				+ " order by upColumnName";
		return cd.executeQuery(sql, new Object[]{});
	}
	//获取一级栏目
	public List<Map<String,Object>> getOneLevelColumns(){
		
		String sql = "select * from columns where upid is null or upid = ''";
		return cd.executeQuery(sql, new Object[]{});
	}
	//获取二级栏目
	public List<Map<String,Object>> getTwoLevelColumns(){
		
		String sql = "select twoLevel.*,oneLevel.columnName as upColumnName from columns as twoLevel left join columns as oneLevel on twoLevel.upid = oneLevel.columnId where twoLevel.upid is not null or twoLevel.upid != ''";
		return cd.executeQuery(sql, new Object[]{});
	}
	//增
	public List<Map<String,Object>> addColumn(Map<String,Object> column){
		List<Map<String,Object>> result = new ArrayList<Map<String,Object>>();
		Map<String,Object> resultMap = new HashMap<String,Object>();
		result.add(resultMap);
		boolean isOK = true;
		String insertSql1 = "insert into columns(columnName,url";
		String insertSql2 = ") values(?,?";
		ArrayList<Object> list = new ArrayList<Object>();
		//检查栏目名
		String name = column.get("columnName").toString();
		list.add(name);
		if(name==null || name.equals("")){
			resultMap.put("nameMessage", "栏目名不能为空");
			isOK = false;
		}else{
			//到数据库中验证该栏目是否存在
			String sql = "select count(`columnName`) as count from columns where columnName=?";
			int count = Integer.parseInt(cd.executeQuery(sql, new Object[]{name}).get(0).get("count").toString());
			if(count>0){
				resultMap.put("nameMessage", "该栏目已经存在");
				isOK = false;
			}
		}
		//检查链接地址
		String url = column.get("url").toString();
		list.add(url);
		if(url==null || url.equals("")){
			resultMap.put("urlMessage", "链接地址不能为空");
			isOK = false;
		}
		//检查上级栏目
		if(!column.get("upid").equals("")){
			Double upidD = new Double(column.get("upid").toString());
			Long upid = upidD.longValue();
			insertSql1 += (",upid" + insertSql2 + ",?)");
			list.add(upid);
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
	//删
	public List<Map<String,Object>> deleteColumnById(Long id){
		int result = 0;
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		Map<String,Object> map = new HashMap<String,Object>();
		list.add(map);
		try{
			String sql = "delete from columns where columnId = ?";
			result = cd.executeUpdate(sql, new Object[]{id});
		}
		catch(Exception ex){
			result = 0;
		}
		list.get(0).put("result", result);
		return list;
	}
	//改
	public List<Map<String,Object>> editColumn(Map<String,Object> column){
		List<Map<String,Object>> result = new ArrayList<Map<String,Object>>();
		Map<String,Object> resultMap = new HashMap<String,Object>();
		result.add(resultMap);
		boolean isOK = true;
		
		Long columnId = new Double(column.get("columnId").toString()).longValue();
		//检查栏目名
		String name = column.get("columnName").toString();
		if(name==null || name.equals("")){
			resultMap.put("nameMessage", "栏目名不能为空");
			isOK = false;
		}else{
			//到数据库中验证该帐号是否存在
			String sql = "select columnId from columns where columnName=?";
			List<Map<String,Object>> hasList = cd.executeQuery(sql, new Object[]{name});
			if(hasList.size() != 0){
				String columnIdInDB = hasList.get(0).get("columnId").toString();
				if(!columnId.toString().equals(columnIdInDB)){
					resultMap.put("nameMessage", "该栏目已经存在");
					isOK = false;
				}
			}
		}
		//检查链接地址
		String url = column.get("url").toString();
		if(url==null || url.equals("")){
			resultMap.put("urlMessage", "链接地址不能为空");
			isOK = false;
		}
		//获取上级栏目，空则为null
		Object upid = column.get("upid");
		
		if(isOK){
			//保存到数据库
			String updateSql = "update columns set columnName=?,url=?,upid=? where columnId=?";
			int updateCount = cd.executeUpdate(updateSql, new Object[]{name,url,upid,columnId});
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
}
