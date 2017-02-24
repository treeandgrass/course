package com.cqut.generalCourse.entity;

import java.io.Serializable;

public class Picture implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1250401698518890345L;

	private Long pictureId;
	
	private String url;

	public Long getPictureId() {
		return pictureId;
	}

	public void setPictureId(Long pictureId) {
		this.pictureId = pictureId;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
}
