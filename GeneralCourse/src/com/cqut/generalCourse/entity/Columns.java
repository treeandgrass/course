package com.cqut.generalCourse.entity;

import java.io.Serializable;

public class Columns implements Serializable {

	private static final long serialVersionUID = 7439755392025939820L;
	
	private Long columnId;
	
	private String columnName;
	
	private Long upId;

	public Long getColumnId() {
		return columnId;
	}

	public void setColumnId(Long columnId) {
		this.columnId = columnId;
	}

	public String getColumnName() {
		return columnName;
	}

	public void setColumnName(String columnName) {
		this.columnName = columnName;
	}

	public Long getUpId() {
		return upId;
	}

	public void setUpId(Long upId) {
		this.upId = upId;
	}
}
