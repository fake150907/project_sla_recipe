package com.sla.project.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UploadedImageVO {
	private int id;
	private String filePath;

	public UploadedImageVO(String filePath) {
		this.filePath = filePath;
	}

	// Getters and Setters
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	// toString() method for debugging/logging
	@Override
	public String toString() {
		return "UploadedImageVO{" + "id=" + id + ", filePath='" + filePath + '\'' + '}';
	}
}
