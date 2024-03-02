package com.sla.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sla.project.service.RecipeService;
import com.sla.project.util.Ut;
import com.sla.project.vo.Recipe;
import com.sla.project.vo.ResultData;
import com.sla.project.vo.Rq;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class UsrRecipeController {

	@Autowired
	private RecipeService recipeService;

	@RequestMapping("/usr/recipe/write")
	public String showWrite(HttpServletRequest req) {

		return "usr/recipe/write";
	}

	@RequestMapping("/usr/recipe/doWrite")
	@ResponseBody
	public String doWrite(HttpServletRequest req, String title, String body, int categoryId) {

		Rq rq = (Rq) req.getAttribute("rq");

		if (Ut.isNullOrEmpty(title)) {
			return Ut.jsHistoryBack("F-1", "제목을 입력해주세요");
		}
		if (Ut.isNullOrEmpty(body)) {
			return Ut.jsHistoryBack("F-2", "내용을 입력해주세요");
		}

		ResultData<Integer> writeRecipeRd = recipeService.writeRecipe(rq.getLoginedMemberId(), title, body, categoryId);

		int id = (int) writeRecipeRd.getData1();

		Recipe recipe = recipeService.getRecipe(id);

		return Ut.jsReplace(writeRecipeRd.getResultCode(), writeRecipeRd.getMsg(), "../recipe/detail?id=" + id);

	}
}
