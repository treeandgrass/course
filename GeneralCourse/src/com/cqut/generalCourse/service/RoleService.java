package com.cqut.generalCourse.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cqut.generalCourse.dao.CommonDAO;

public class RoleService {
public CommonDAO cd = new CommonDAO();
	//查找所有
	public List<Map<String,Object>> getRoles(){
		String sql = "select * from role";
		
		return cd.executeQuery(sql, new Object[]{});
	}
	//根据id查找
	public List<Map<String,Object>> getRoleById(Long id){
		String sql = "select * from role where roleId = ?";
		return cd.executeQuery(sql, new Object[]{id});
	}
	//增
	public List<Map<String,Object>> addRole(Map role){
		List<Map<String,Object>> result = new ArrayList<Map<String,Object>>();
		Map<String,Object> resultMap = new HashMap<String,Object>();
		result.add(resultMap);
		boolean isOK = true;
		//检查角色名
		String name = role.get("roleName").toString();
		if(name==null || name.equals("")){
			resultMap.put("nameMessage", "角色名不能为空");
			isOK = false;
		}else{
			//到数据库中验证该帐号是否存在
			String sql = "select count(`roleName`) as count from role where roleName=?";
			int count = Integer.parseInt(cd.executeQuery(sql, new Object[]{name}).get(0).get("count").toString());
			if(count>0){
				resultMap.put("nameMessage", "该角色已经存在");
				isOK = false;
			}
		}
		if(isOK){
			//保存到数据库
			String insertSql = "insert into role(roleName) values(?)";
			int updateCount = cd.executeUpdate(insertSql, new Object[]{name});
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
	public List<Map<String,Object>> deleteRoleById(Long id){
		int result = 0;
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		Map<String,Object> map = new HashMap<String,Object>();
		list.add(map);
		try{
			String sql = "delete from role where roleId = ?";
			result = cd.executeUpdate(sql, new Object[]{id});
		}
		catch(Exception ex){
			result = 0;
		}
		list.get(0).put("result", result);
		return list;
	}
	//改
	public List<Map<String,Object>> editRole(Map role){
		List<Map<String,Object>> result = new ArrayList<Map<String,Object>>();
		Map<String,Object> resultMap = new HashMap<String,Object>();
		result.add(resultMap);
		boolean isOK = true;
		
		Long roleId = new Double(role.get("roleId").toString()).longValue();
		
		//检查角色名
		String name = role.get("roleName").toString();
		if(name==null || name.equals("")){
			resultMap.put("nameMessage", "角色名不能为空");
			isOK = false;
		}else{
			//到数据库中验证该帐号是否存在
			String sql = "select roleId from role where roleName=?";
			List<Map<String,Object>> hasList = cd.executeQuery(sql, new Object[]{name});
			if(hasList.size() != 0){
				String roleIdInDB = hasList.get(0).get("roleId").toString();
				if(!roleId.toString().equals(roleIdInDB)){
					resultMap.put("nameMessage", "该角色名已经存在");
					isOK = false;
				}
			}
		}
		
		if(isOK){
			Date registerTime = new Date();
			//保存到数据库
			String updateSql = "update role set " +
					"roleName=? where roleId=?";
			int updateCount = cd.executeUpdate(updateSql, new Object[]{name,roleId});
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
