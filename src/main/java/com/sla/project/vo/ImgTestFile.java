package com.sla.project.vo;

import java.util.List;

import org.springframework.context.annotation.Configuration;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Getter
@Setter
@Configuration
public class ImgTestFile {
	private int id;
	private String imagePath;
	private String original_file_name; 

	private long file_size;

	private List<ImgTestFile> pictures;
}
