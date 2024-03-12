package com.sla.project.vo;

import org.springframework.data.annotation.Id;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Getter
public class UploadedPhoto {
	@Id
	private Long id;
	private String fileName;
	private String filePath;

	public UploadedPhoto(String fileName, String filePath) {
		this.fileName = fileName;
		this.filePath = filePath;
	}

	// Constructors, Getters, and Setters
}