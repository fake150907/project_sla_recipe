package com.sla.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sla.project.service.ReactionPointService;
import com.sla.project.service.IngredientService;
import com.sla.project.util.Ut;
import com.sla.project.vo.Ingredient;
import com.sla.project.vo.ResultData;
import com.sla.project.vo.Rq;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class UsrIngredientController {

	@Autowired
	private Rq rq;

	@Autowired
	private IngredientService ingredientService;

	@Autowired
	private ReactionPointService reactionPointService;

	@RequestMapping("/usr/ingredient/doWrite")
	@ResponseBody
	public String doWrite(HttpServletRequest req, String ingredientName, String ingredientMeasure, int recipeId) {

		Rq rq = (Rq) req.getAttribute("rq");

		if (Ut.isNullOrEmpty(ingredientName)) {
			return Ut.jsHistoryBack("F-1", "ingredientName을 입력해주세요");
		}
		if (Ut.isEmpty(ingredientMeasure)) {
			return Ut.jsHistoryBack("F-2", "ingredientMeasure을 입력해주세요");
		}

		ResultData<Integer> writeIngredientRd = ingredientService.writeIngredient(rq.getLoginedMemberId(),
				ingredientName, ingredientMeasure, recipeId);

		int id = (int) writeIngredientRd.getData1();

		return Ut.jsReplace(writeIngredientRd.getResultCode(), writeIngredientRd.getMsg(),
				"../recipe/detail?id=" + recipeId);

	}

	@RequestMapping("/usr/ingredient/ingredientList")
	@ResponseBody
	public List<Ingredient> showIngredientList(HttpServletRequest req, Model model, int recipeId, String relTypeCode) {

		Rq rq = (Rq) req.getAttribute("rq");

		List<Ingredient> ingredients = ingredientService.getForPrintIngredients(rq.getLoginedMemberId(), recipeId);

		model.addAttribute("ingredients", ingredients);

		return ingredients;
	}

	@RequestMapping("/usr/ingredient/doDelete")
	@ResponseBody
	public String doDelete(HttpServletRequest req, int id, String replaceUri) {
		Rq rq = (Rq) req.getAttribute("rq");

		Ingredient ingredient = ingredientService.getIngredient(id);

		if (ingredient == null) {
			return Ut.jsHistoryBack("F-1", Ut.f("%d번 댓글은 존재하지 않습니다", id));
		}

		ResultData loginedMemberCanDeleteRd = ingredientService.userCanDelete(rq.getLoginedMemberId(), ingredient);

		if (loginedMemberCanDeleteRd.isSuccess()) {
			ingredientService.deleteIngredient(id);
		}

//		if (Ut.isNullOrEmpty(replaceUri)) {
//			switch (ingredient.getRelTypeCode()) {
//			case "ingredient":
//				replaceUri = Ut.f("../ingredient/detail?id=%d", ingredient.getRecipeId());
//				break;
//			}
//		}

		return Ut.jsReplace(loginedMemberCanDeleteRd.getResultCode(), loginedMemberCanDeleteRd.getMsg(), replaceUri);
	}

	@RequestMapping("/usr/ingredient/doModify")
	@ResponseBody
	public String doModify(HttpServletRequest req, int id, String body) {
		System.err.println(id);
		System.err.println(body);
		Rq rq = (Rq) req.getAttribute("rq");

		Ingredient ingredient = ingredientService.getIngredient(id);

		if (ingredient == null) {
			return Ut.jsHistoryBack("F-1", Ut.f("%d번 댓글은 존재하지 않습니다", id));
		}

		ResultData loginedMemberCanModifyRd = ingredientService.userCanModify(rq.getLoginedMemberId(), ingredient);

		if (loginedMemberCanModifyRd.isSuccess()) {
			ingredientService.modifyIngredient(id, body);
		}

		ingredient = ingredientService.getIngredient(id);

		return ingredient.getIngredientName();
	}

}