package com.cqut.generalCourse.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cqut.generalCourse.dao.CommonDAO;

public class ModuleService {

	public CommonDAO cd = new CommonDAO();
	//用Id搜索
	public List<Map<String,Object>> getModuleById(Long id){
		String sql = "select * from module where moduleId = ?";
		return cd.executeQuery(sql, new Object[]{id});
	}
	//获取所有
	public List<Map<String,Object>> getAllModule(){
		
		String sql = "select secondLevel.*,oneLevel.moduleName as upModuleName "
				+ "from module as secondLevel "
				+ "left join module as oneLevel on secondLevel.upid = oneLevel.moduleId";
		return cd.executeQuery(sql, new Object[]{});
	}
	//获取一级模块
	public List<Map<String,Object>> getOneLevelModules(){
		
		String sql = "select * from module where upid is null or upid = ''";
		return cd.executeQuery(sql, new Object[]{});
	}
	//根据当前用户获取模块
	public List<Map<String,Object>> getModulesByCurrentUser(String userId){
		String sql = "select * from module,permission,users "
				+ "where users.userId = ? and users.roleId = permission.roleId and permission.moduleId = module.moduleId order by module.moduleId";
		return cd.executeQuery(sql, new Object[]{userId});
	}
	//获取角色可用模块
	public List<Map<String,Object>> getModulesByRoleId(String roleId){
		String sql = "select * from permission right join module on permission.moduleId = module.moduleId "
				+ "where permission.roleId = ?";
		return cd.executeQuery(sql, new Object[]{roleId});
	}
	//增
	public List<Map<String,Object>> addModule(Map<String,Object> module){
		List<Map<String,Object>> result = new ArrayList<Map<String,Object>>();
		Map<String,Object> resultMap = new HashMap<String,Object>();
		result.add(resultMap);
		boolean isOK = true;
		String insertSql1 = "insert into module(moduleName,url";
		String insertSql2 = ") values(?,?";
		ArrayList<Object> list = new ArrayList<Object>();
		//检查模块名
		String name = module.get("moduleName").toString();
		list.add(name);
		if(name==null || name.equals("")){
			resultMap.put("nameMessage", "模块名不能为空");
			isOK = false;
		}else{
			//到数据库中验证该模块是否存在
			String sql = "select count(`moduleName`) as count from module where moduleName=?";
			int count = Integer.parseInt(cd.executeQuery(sql, new Object[]{name}).get(0).get("count").toString());
			if(count>0){
				resultMap.put("nameMessage", "该模块已经存在");
				isOK = false;
			}
		}
		//检查链接地址
		String url = module.get("url").toString();
		list.add(url);
		if(url==null || url.equals("")){
			resultMap.put("urlMessage", "链接地址不能为空");
			isOK = false;
		}
		//是否有上级模块
		if(!module.get("upid").equals("")){
			Double upidD = new Double(module.get("upid").toString());
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
	public List<Map<String,Object>> deleteModuleById(Long id){
		int result = 0;
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		Map<String,Object> map = new HashMap<String,Object>();
		list.add(map);
		try{
			String sql = "delete from module where moduleId = ?";
			result = cd.executeUpdate(sql, new Object[]{id});
		}
		catch(Exception ex){
			result = 0;
		}
		list.get(0).put("result", result);
		return list;
	}
	//改
	public List<Map<String,Object>> editModule(Map<String,Object> module){
		List<Map<String,Object>> result = new ArrayList<Map<String,Object>>();
		Map<String,Object> resultMap = new HashMap<String,Object>();
		result.add(resultMap);
		boolean isOK = true;
		
		Long moduleId = new Double(module.get("moduleId").toString()).longValue();
		//检查模块名
		String name = module.get("moduleName").toString();
		if(name==null || name.equals("")){
			resultMap.put("nameMessage", "模块名不能为空");
			isOK = false;
		}else{
			//到数据库中验证该帐号是否存在
			String sql = "select moduleId from module where moduleName=?";
			List<Map<String,Object>> hasList = cd.executeQuery(sql, new Object[]{name});
			if(hasList.size() != 0){
				String moduleIdInDB = hasList.get(0).get("moduleId").toString();
				if(!moduleId.toString().equals(moduleIdInDB)){
					resultMap.put("nameMessage", "该模块已经存在");
					isOK = false;
				}
			}
		}
		//检查链接地址
		String url = module.get("url").toString();
		if(url==null || url.equals("")){
			resultMap.put("urlMessage", "链接地址不能为空");
			isOK = false;
		}
		//获取上级模块
		Object upid = module.get("upid");
		
		if(isOK){
			//保存到数据库
			String updateSql = "update module set moduleName=?,url=?,upid=? where moduleId=?";
			int updateCount = cd.executeUpdate(updateSql, new Object[]{name,url,upid,moduleId});
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
