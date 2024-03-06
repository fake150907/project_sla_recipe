package com.sla.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UsrGroupBuyingController {

	@RequestMapping("/usr/GroupBuying/location")
	public String showLocationPage() {

		return "/usr/GroupBuying/location";
	}
}
