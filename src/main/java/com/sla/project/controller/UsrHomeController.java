package com.sla.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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

<<<<<<< HEAD
}
=======
}
>>>>>>> 8830125ab1f6bb878018ae6112ad7711b94bd968
