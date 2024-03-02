package com.sla.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UsrIngredientController {

	@RequestMapping("/usr/ingredient/groupBuying")
	public String showGroupBuyingPage() {

		return "/usr/ingredient/groupBuying";
	}
}
