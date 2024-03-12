package com.sla.project.controller;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.sla.project.repository.UploadedPhotoRepository;
import com.sla.project.service.UploadedPhotoService;
import com.sla.project.vo.UploadedPhoto;

@Controller
public class FileUploadController {
	@Autowired
	private UploadedPhotoRepository uploadedPhotoRepository; // Assuming you have a repository for managing uploaded
																// photos
	@Autowired
	@Value("${file.upload-dir}")
	private String uploadDir;

	@Autowired
	private final UploadedPhotoService uploadedPhotoService;

	@Autowired
	public FileUploadController(UploadedPhotoService uploadedPhotoService) {
		this.uploadedPhotoService = uploadedPhotoService;
	}

	// Other controller methods...

	@PostMapping("/upload")
	public ModelAndView uploadFile(@RequestParam("file") MultipartFile file) {
		ModelAndView modelAndView = new ModelAndView();
		if (file.isEmpty()) {
			modelAndView.setViewName("usr/home/upload");
			modelAndView.addObject("message", "Please select a file to upload");
			return modelAndView;
		}

		try {
			byte[] bytes = file.getBytes();
			String fileName = file.getOriginalFilename();
			String filePath = uploadDir + "/" + fileName;
			File dest = new File(filePath);
			file.transferTo(dest);

			UploadedPhoto uploadedPhoto = new UploadedPhoto(fileName, filePath);
			uploadedPhotoService.saveUploadedPhoto(uploadedPhoto);

			modelAndView.setViewName("usr/home/upload");
			modelAndView.addObject("message", "File uploaded successfully");
		} catch (IOException e) {
			e.printStackTrace();
			modelAndView.setViewName("usr/home/upload");
			modelAndView.addObject("message", "Failed to upload file");
		}
		return modelAndView;
	}
}
