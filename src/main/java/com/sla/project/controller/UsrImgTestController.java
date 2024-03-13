package com.sla.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.sla.project.repository.ImgTestFileRepository;
import com.sla.project.service.ImgTestFileService;
import com.sla.project.vo.Rq;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class UsrImgTestController {

	@Autowired
	public ImgTestFileService imgTestFileService;
	private ImgTestFileRepository imgTestFileRepository;

	@RequestMapping("/usr/home/imgTest")
	public String showImgTest() {

		return "/usr/home/imgTest";
	}

	@RequestMapping("/usr/home/doImgTest")
	public void doImgTest(MultipartHttpServletRequest multipartHttpServletRequest, HttpServletRequest req,
			MultipartFile inputImgFile) throws Exception {
		Rq rq = (Rq) req.getAttribute("rq");

		imgTestFileService.inputImgTestFile(inputImgFile);

	}
}
