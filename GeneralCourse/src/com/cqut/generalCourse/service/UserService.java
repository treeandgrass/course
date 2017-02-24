package com.cqut.generalCourse.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cqut.generalCourse.dao.CommonDAO;

public class UserService {

	public CommonDAO cd = new CommonDAO();
	//根据id获取用户
	public List<Map<String,Object>> getUserById(Long id){
		String sql = "select * from users left join role on users.roleId = role.roleId left join picture on users.photoId = picture.pictureId where userId = ?";
		List<Map<String,Object>> list = cd.executeQuery(sql, new Object[]{id});
		Map<String,Object> user = list.get(0);
		user.put("registerTime", user.get("registerTime").toString().substring(0, 19));
		return list;
	}
	//获取组成员
	public List<Map<String,Object>> getTeamers(){
		
		String sql = "select * from users left join picture on photoId = pictureId";
		return cd.executeQuery(sql, new Object[]{});
	}
	//根据参数查找用户
	public List<Map<String,Object>> getUsersByParams(Map datas){
		List<Object> params = new ArrayList<Object>();
		String sql = "select * from users left join role on users.roleId = role.roleId where 1=1 ";
		//添加查询参数
		if(datas.get("name") != null && !datas.get("name").equals("")){
			sql += " and users.userName like ?";
			params.add("%" + datas.get("name") + "%");
		}
		if(datas.get("registerTimeStart") != null && !datas.get("registerTimeStart").equals("")){
			sql += " and users.registerTime >= ?";
			params.add(datas.get("registerTimeStart") + " 00:00:00");
		}
		if(datas.get("registerTimeEnd") != null && !datas.get("registerTimeEnd").equals("")){
			sql += " and users.registerTime <= ?";
			params.add(datas.get("registerTimeEnd") + " 23:59:59");
		}
		if(datas.get("roleId") != null && !datas.get("roleId").equals("")){
			sql += " and users.roleId = ?";
			params.add(datas.get("roleId"));
		}
		if(datas.get("email") != null && !datas.get("email").equals("")){
			sql += " and users.email like ?";
			params.add("%" + datas.get("email") + "%");
		}
		if(datas.get("phone") != null && !datas.get("phone").equals("")){
			sql += " and users.phone like ?";
			params.add("%" + datas.get("phone") + "%");
		}
		if(datas.get("sex") != null && !datas.get("sex").equals("")){
			sql += " and users.sex = ?";
			params.add(datas.get("sex"));
		}
		sql += "order by registerTime DESC";
		List<Map<String,Object>> list = cd.executeQuery(sql, params.toArray());
		for(int i = 0;i < list.size();i++){
			Map<String,Object> user = list.get(i);
			user.put("registerTime", user.get("registerTime").toString().substring(0, 19));
		}
		
		return list;
	}
	//增
	public List<Map<String,Object>> addUser(Map user){
		List<Map<String,Object>> result = new ArrayList<Map<String,Object>>();
		Map<String,Object> resultMap = new HashMap<String,Object>();
		result.add(resultMap);
		boolean isOK = true;
		//检查用户名
		String name = user.get("userName").toString();
		if(name==null || name.equals("")){
			resultMap.put("nameMessage", "帐号不能为空");
			isOK = false;
		}
		else if(name.length() > 15){
			resultMap.put("nameMessage", "帐号不能超过15个字符");
			isOK = false;
		}
		else{
			//到数据库中验证该帐号是否存在
			String sql = "select count(`userName`) as count from users where userName=?";
			int count = Integer.parseInt(cd.executeQuery(sql, new Object[]{name}).get(0).get("count").toString());
			if(count>0){
				resultMap.put("nameMessage", "该帐号已经存在");
				isOK = false;
			}
		}
		//检查密码
		String password = user.get("password").toString();
		String repassword = user.get("repassword").toString();
		if(password==null || password.equals("")){
			resultMap.put("passwordMessage", "密码不能为空");
			isOK = false;
		}
		else{
			if(repassword == null || repassword.equals("")){
				resultMap.put("repasswordMessage", "请再次输入密码");
				isOK = false;
			}
			else if(!password.equals(repassword)){
				resultMap.put("repasswordMessage", "输入密码不一致");
				isOK = false;
			}
		}
		//性别
		String sex = user.get("sex").toString();
		if(sex == null || sex.equals("")){
			resultMap.put("sexMessage", "未选择性别");
			isOK = false;
		}
		//邮箱、电话
		Object email = user.get("email");
		if(email == null)
			isOK = false;
		Object phone = user.get("phone");
		//用户类型
		String roleId = user.get("roleId").toString();
		if(roleId == null || roleId.equals("")){
			resultMap.put("roleMessage", "未选择用户类型");
			isOK = false;
		}
		
		if(isOK){
			Date registerTime = new Date();
			//保存到数据库
			String insertSql = "insert into users(userName,password,registerTime,roleId,email,phone,sex) values(?,?,?,?,?,?,?)";
			int updateCount = cd.executeUpdate(insertSql, new Object[]{name,password,registerTime,roleId,email,phone,sex});
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
	public List<Map<String,Object>> deleteUserById(Long id){
		int result = 0;
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		Map<String,Object> map = new HashMap<String,Object>();
		list.add(map);
		try{
			String sql = "delete from users where userId = ?";
			result = cd.executeUpdate(sql, new Object[]{id});
		}
		catch(Exception ex){
			result = 0;
		}
		list.get(0).put("result", result);
		return list;
	}
	//改
	public List<Map<String,Object>> editUser(Map user){
		List<Map<String,Object>> result = new ArrayList<Map<String,Object>>();
		Map<String,Object> resultMap = new HashMap<String,Object>();
		result.add(resultMap);
		boolean isOK = true;
		
		Long userId = new Double(user.get("userId").toString()).longValue();
		
		//检查用户名
		String name = user.get("userName").toString();
		if(name==null || name.equals("")){
			resultMap.put("nameMessage", "帐号不能为空");
			isOK = false;
		}else{
			//到数据库中验证该帐号是否存在
			String sql = "select userId from users where userName=?";
			List<Map<String,Object>> list = cd.executeQuery(sql, new Object[]{name});
			if(list.size() != 0){
				String userIdInDB = list.get(0).get("userId").toString();
				if(!userId.toString().equals(userIdInDB)){
					resultMap.put("nameMessage", "该帐号已经存在");
					isOK = false;
				}
			}
		}
		//检查密码
		String oldPassword = user.get("oldPassword") != null?user.get("oldPassword").toString():"";
		String newPassword = user.get("newPassword") != null?user.get("newPassword").toString():"";
		String reNewPassword = user.get("reNewPassword") != null?user.get("reNewPassword").toString():"";
		//判断密码是否为空,若为空则不修改
		if(oldPassword!=null && !oldPassword.equals("")){
			//到数据库中验证该密码是否正确
			String sql = "select password from users where userId=?";
			String passwordInDB = cd.executeQuery(sql, new Object[]{userId}).get(0).get("password").toString();
			if(!oldPassword.equals(passwordInDB)){
				resultMap.put("oldPasswordMessage", "旧密码不正确");
				isOK = false;
			}

			if(newPassword==null || newPassword.equals("")){
				resultMap.put("newPasswordMessage", "新密码不能为空");
				isOK = false;
			}
			else if(oldPassword.equals(newPassword)){
				resultMap.put("newPasswordMessage", "新旧密码相同");
				isOK = false;
			}
			if(reNewPassword==null || reNewPassword.equals("")){
				resultMap.put("reNewPasswordMessage", "请再次输入新密码");
				isOK = false;
			}
			else if(!newPassword.equals(reNewPassword)){
				resultMap.put("reNewPasswordMessage", "输入密码不一致");
				isOK = false;
			}
		}
		else{
			String sql = "select password from users where userId=?";
			newPassword = cd.executeQuery(sql, new Object[]{userId}).get(0).get("password").toString();
		}
		//获取性别、邮箱、电话、用户类型
		int sex = new Double(user.get("sex").toString()).intValue();
		Object email = user.get("email");
		if(email == null){
			isOK = false;
		}
		Object phone = user.get("phone");
		Long roleId = new Double(user.get("roleId").toString()).longValue();
		
		if(isOK){
			//保存到数据库
			String updateSql = "update users set " +
					"userName=?, " +
					"roleId=?," +
					"email=?, " +
					"phone=?, " +
					"sex=?," +
					"password=? " +
					"where userId=?";
			int updateCount = cd.executeUpdate(updateSql, new Object[]{name,roleId,email,phone,sex,newPassword,userId});
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
