package com.cqut.generalCourse.entity;

import java.io.Serializable;

public class Permission implements Serializable {
	
	private static final long serialVersionUID = -4464732374097416433L;

	private Long permissionId;
	
	private Long roleId;
	
	private Long moduleId;

	public Long getPermissionId() {
		return permissionId;
	}

	public void setPermissionId(Long permissionId) {
		this.permissionId = permissionId;
	}

	public Long getRoleId() {
		return roleId;
	}

	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}

	public Long getModuleId() {
		return moduleId;
	}

	public void setModuleId(Long moduleId) {
		this.moduleId = moduleId;
	}
}
