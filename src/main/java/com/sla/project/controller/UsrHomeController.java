package com.sla.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UsrHomeController {

	@RequestMapping("/usr/home/main")
	public String showMain() {

		return "/usr/home/main";
	}

	@RequestMapping("/")
	public String showRoot() {

		return "redirect:/usr/home/main";
	}

	@RequestMapping("/usr/home/search")
	public String showSearhPage() {

		return "/usr/home/search";
	}
	
	@RequestMapping("/usr/home/contact")
	public String showContactPage() {

		return "/usr/home/contact";
	}

}
