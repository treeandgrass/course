package com.cqut.generalCourse.entity;

import java.io.Serializable;

public class Module implements Serializable {

	private static final long serialVersionUID = 1956849013741050008L;
	
	private Long moduleId;
	
	private String moduleName;
	
	private String url;

	public Long getModuleId() {
		return moduleId;
	}

	public void setModuleId(Long moduleId) {
		this.moduleId = moduleId;
	}

	public String getModuleName() {
		return moduleName;
	}

	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
}
