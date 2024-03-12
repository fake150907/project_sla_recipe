package com.sla.project.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

@Controller
public class FileUploadController {

	@Value("${file.upload-dir}")
	private String uploadDir;

	@GetMapping("/usr/home/upload")
	public String showUploadForm() {
		return "usr/home/upload"; // Assuming upload.jsp is in /WEB-INF/jsp/usr/home/ directory
	}

	@PostMapping("/usr/home/upload")
	public ModelAndView uploadFile(@RequestParam("file") MultipartFile file) {
		ModelAndView modelAndView = new ModelAndView();
		if (file.isEmpty()) {
			modelAndView.setViewName("usr/home/upload");
			modelAndView.addObject("message", "Please select a file to upload");
			return modelAndView;
		}

		try {
			// Get the file and save it
			byte[] bytes = file.getBytes();
			String fileName = file.getOriginalFilename();
			String filePath = uploadDir + "/" + fileName; // Change this to your desired upload directory
			File dest = new File(filePath);
			file.transferTo(dest);
			modelAndView.setViewName("usr/home/upload");
			modelAndView.addObject("message", "File uploaded successfully");
		} catch (IOException e) {
			e.printStackTrace();
			modelAndView.setViewName("usr/home/upload");
			modelAndView.addObject("message", "Failed to upload file");
		}
		return modelAndView;
	}

	@GetMapping("/usr/home/photos")
	public String viewPhotos() {
		ModelAndView modelAndView = new ModelAndView("usr/home/photos");
		File[] files = new File(uploadDir).listFiles();
		List<String> photoUrls = new ArrayList<>();
		if (files != null) {
			for (File file : files) {
				if (file.isFile()) {
					String url = ServletUriComponentsBuilder.fromCurrentContextPath().path("/uploads/")
							.path(file.getName()).toUriString();
					photoUrls.add(url);
				}
			}
		}
		modelAndView.addObject("photoUrls", photoUrls);

		return "/usr/home/photos";
	}
}