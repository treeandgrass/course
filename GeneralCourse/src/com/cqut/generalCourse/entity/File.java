package com.cqut.generalCourse.entity;

import java.io.Serializable;

public class File implements Serializable {

	private static final long serialVersionUID = -264960913505838894L;

	private Long fileId;
	
	private String url;
	
	private Integer downloadCount;

	public Long getFileId() {
		return fileId;
	}

	public void setFileId(Long fileId) {
		this.fileId = fileId;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Integer getDownloadCount() {
		return downloadCount;
	}

	public void setDownloadCount(Integer downloadCount) {
		this.downloadCount = downloadCount;
	}
}
