package com.cqut.generalCourse.entity;

import java.io.Serializable;

public class Article_Picture implements Serializable {
	
	private static final long serialVersionUID = -3847257042075926165L;
	
	private Long APId;
	
	private Long articleId;
	
	private Long pictureId;

	public Long getAPId() {
		return APId;
	}

	public void setAPId(Long aPId) {
		APId = aPId;
	}

	public Long getArticleId() {
		return articleId;
	}

	public void setArticleId(Long articleId) {
		this.articleId = articleId;
	}

	public Long getPictureId() {
		return pictureId;
	}

	public void setPictureId(Long pictureId) {
		this.pictureId = pictureId;
	}
}
