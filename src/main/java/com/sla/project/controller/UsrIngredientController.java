package com.sla.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UsrIngredientController {

	@RequestMapping("/usr/ingredient/location")
	public String showLocationPage() {

		return "/usr/ingredient/location";
	}
}
