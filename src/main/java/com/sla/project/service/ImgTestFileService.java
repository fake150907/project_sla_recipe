package com.sla.project.service;

import java.io.File;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sla.project.interceptor.FileHandler;
import com.sla.project.repository.ImgTestFileRepository;
import com.sla.project.vo.ImgTestFile;

@Service
public class ImgTestFileService {

	@Autowired
	private FileHandler fileHandler;
	@Autowired
	public ImgTestFileRepository imgTestFileRepository;

	@Autowired
	private ImgTestFile imgTestFile;

	public void inputImgTestFile(MultipartFile inputImgFile) throws Exception {
		String projectPath = System.getProperty("user.dir") + "/src/main/resources/static/files";

		UUID uuid = UUID.randomUUID();

		String fileName = uuid + "_" + inputImgFile.getOriginalFilename();

		File saveFile = new File(projectPath, fileName);

		inputImgFile.transferTo(saveFile);
	}

	public ImgTestFile getImgTestFile(int id) {
		return imgTestFileRepository.getImgTestFile(id);
	}

}
