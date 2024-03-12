package com.sla.project.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Post {
	private Long id;
	private String title;
	private String content;
	private String imagePath;

	// Getters and setters
}