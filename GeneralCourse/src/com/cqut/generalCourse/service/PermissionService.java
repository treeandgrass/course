package com.cqut.generalCourse.service;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cqut.generalCourse.dao.CommonDAO;

public class PermissionService {

	public CommonDAO cd = new CommonDAO();
	//增
	public List<Map<String,Object>> addPermission(Map<String,Object> permission){
		List<Map<String,Object>> result = new ArrayList<Map<String,Object>>();
		Map<String,Object> resultMap = new HashMap<String,Object>();
		result.add(resultMap);
		Object roleId = permission.get("roleId");
		Object moduleId = permission.get("moduleId");
		//检查是否已有该权限
		String selectSql = "select count(*) as count from permission where roleId = ? and moduleId = ?";
		List<Map<String,Object>> list = cd.executeQuery(selectSql, new Object[]{roleId,moduleId});
		int count = Integer.parseInt(list.get(0).get("count").toString());
		if(count == 0){
			//没有才增加
			String sql = "insert into permission(roleId,moduleId) values (?,?)";
			int insertCount = cd.executeUpdate(sql, new Object[]{roleId,moduleId});
			if(insertCount == 1)
				resultMap.put("success",insertCount);
			else
				resultMap.put("errorMessage","添加权限失败，请刷新重试");
		}
		return result;
	}
	//删
	public List<Map<String,Object>> deletePermission(Map<String,Object> permission){
		List<Map<String,Object>> result = new ArrayList<Map<String,Object>>();
		Map<String,Object> resultMap = new HashMap<String,Object>();
		result.add(resultMap);
		String sql = "delete from permission where roleId = ? and moduleId = ?";
		int deleteCount = cd.executeUpdate(sql, new Object[]{permission.get("roleId"),permission.get("moduleId")});
		if(deleteCount == 1)
			resultMap.put("success",deleteCount);
		else
			resultMap.put("errorMessage","删除权限失败，请刷新重试");
		return result;
	}
}
