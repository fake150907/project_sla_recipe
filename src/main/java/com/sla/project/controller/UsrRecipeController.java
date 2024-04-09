package com.sla.project.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.sla.project.service.BoardService;
import com.sla.project.service.GenFileService;
import com.sla.project.service.ReactionPointService;
import com.sla.project.service.RecipeService;
import com.sla.project.service.ReplyService;
import com.sla.project.util.Ut;
import com.sla.project.vo.CookWare;
import com.sla.project.vo.Ingredient;
import com.sla.project.vo.IngredientList;
import com.sla.project.vo.Recipe;
import com.sla.project.vo.ResultData;
import com.sla.project.vo.Rq;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class UsrRecipeController {
	@Autowired
	private Rq rq;

	@Autowired
	private RecipeService recipeService;

	@Autowired
	private GenFileService genFileService;

	@Autowired
	private ReactionPointService reactionPointService;
	@Autowired
	private UsrReplyController usrReplyController;

	@Autowired
	private ReplyService replyService;

	@Autowired
	private BoardService boardService;

	public UsrRecipeController() {

	}

	@RequestMapping("/usr/recipe/search")
	public String showSearhPage() {

		return "/usr/recipe/search";
	}

	@RequestMapping("/usr/recipe/searchList")
	public String showSearchList(HttpServletRequest req, Model model, @RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "title,body") String searchKeywordTypeCode,
			@RequestParam(defaultValue = "") String searchKeyword) {

		Rq rq = (Rq) req.getAttribute("rq");

		if (searchKeyword == null) {
			return Ut.jsHistoryBack("F-1", "검색어가 존재하지 않습니다.");
		}

		int recipesCount = recipeService.getRecipesCount(searchKeywordTypeCode, searchKeyword);

		// 한페이지에 글 10개씩이야
		// 글 20개 -> 2 page
		// 글 24개 -> 3 page
		int itemsInAPage = 10;

		int pagesCount = (int) Math.ceil(recipesCount / (double) itemsInAPage);

		List<Recipe> recipes = recipeService.getForPrintRecipes(itemsInAPage, page, searchKeywordTypeCode,
				searchKeyword);

		model.addAttribute("page", page);
		model.addAttribute("pagesCount", pagesCount);
		model.addAttribute("searchKeywordTypeCode", searchKeywordTypeCode);
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("recipesCount", recipesCount);
		model.addAttribute("recipes", recipes);

		return "/usr/recipe/searchList";
	}

	@RequestMapping("/usr/recipe/list")
	public String showList(HttpServletRequest req, Model model, @RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "title,body") String searchKeywordTypeCode,
			@RequestParam(defaultValue = "") String searchKeyword) {

		Rq rq = (Rq) req.getAttribute("rq");

		int recipesCount = recipeService.getRecipesCount(searchKeywordTypeCode, searchKeyword);

		// 한페이지에 글 10개씩이야
		// 글 20개 -> 2 page
		// 글 24개 -> 3 page
		int itemsInAPage = 10;

		int pagesCount = (int) Math.ceil(recipesCount / (double) itemsInAPage);

		List<Recipe> recipes = recipeService.getForPrintRecipes(itemsInAPage, page, searchKeywordTypeCode,
				searchKeyword);

		model.addAttribute("page", page);
		model.addAttribute("pagesCount", pagesCount);
		model.addAttribute("searchKeywordTypeCode", searchKeywordTypeCode);
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("recipesCount", recipesCount);
		model.addAttribute("recipes", recipes);

		return "usr/recipe/list";
	}

	@RequestMapping("/usr/recipe/detail")
	public String showDetail(HttpServletRequest req, Model model, int id) {
		Rq rq = (Rq) req.getAttribute("rq");

		List<Ingredient> ingredient = recipeService.getForPrintRecipeIngredient(id);
		List<CookWare> cookWare = recipeService.getForPrintRecipeCookWare(id);

		Recipe recipe = recipeService.getForPrintRecipe(rq.getLoginedMemberId(), id);

		boolean isAlreadyAddrecipeGoodRp = reactionPointService.isAlreadyAddGoodRp(rq.getLoginedMemberId(), id,
				"recipe");
		boolean isAlreadyAddrecipeBadRp = reactionPointService.isAlreadyAddBadRp(rq.getLoginedMemberId(), id, "recipe");
		boolean isAlreadyAddReplyGoodRp = reactionPointService.isAlreadyAddGoodRp(rq.getLoginedMemberId(), id, "reply");
		boolean isAlreadyAddReplyBadRp = reactionPointService.isAlreadyAddBadRp(rq.getLoginedMemberId(), id, "reply");

		String relTypeCode = "Recipe";

		model.addAttribute("recipe", recipe);
		model.addAttribute("ingredient", ingredient);
		model.addAttribute("cookWare", cookWare);
		model.addAttribute("isLogined", rq.isLogined());
		model.addAttribute("isAlreadyAddGoodRp", isAlreadyAddrecipeGoodRp);
		model.addAttribute("isAlreadyAddBadRp", isAlreadyAddrecipeBadRp);
		model.addAttribute("isAlreadyAddReplyGoodRp", isAlreadyAddReplyGoodRp);
		model.addAttribute("isAlreadyAddReplyBadRp", isAlreadyAddReplyBadRp);
		model.addAttribute("replies", usrReplyController.showReplyList(req, model, id, relTypeCode));
		model.addAttribute("repliesCount", usrReplyController.showReplyList(req, model, id, relTypeCode).size());
		model.addAttribute("loginedMemberId", rq.getLoginedMemberId());

		return "usr/recipe/detail";
	}

	@RequestMapping("/usr/recipe/doIncreaseHitCountRd")
	@ResponseBody
	public ResultData doIncreaseHitCountRd(int id) {

		ResultData increaseHitCountRd = recipeService.increaseHitCount(id);

		if (increaseHitCountRd.isFail()) {
			return increaseHitCountRd;
		}

		ResultData rd = ResultData.newData(increaseHitCountRd, "hitCount", recipeService.getRecipeHitCount(id));

		rd.setData2("id", id);

		return rd;

	}

	@RequestMapping("/usr/recipe/write")
	public String showWrite(HttpServletRequest req, Model model) {
		int currentId = recipeService.getCurrentRecipeId();

		model.addAttribute("currentId", currentId);
		return "usr/recipe/write";
	}

	@RequestMapping("/usr/recipe/doWrite")
	@ResponseBody
	public String doWrite(HttpServletRequest req, String title, String body, int categoryId, int personnel,
			int cookingTime, int cookLevel, IngredientList ingredients, String cookWareName, String cookWareCount,
			String replaceUri, MultipartRequest multipartRequest) {

		if (Ut.isNullOrEmpty(title)) {
			return Ut.jsHistoryBack("F-1", "제목을 입력해주세요");
		}
		if (Ut.isNullOrEmpty(body)) {
			return Ut.jsHistoryBack("F-2", "내용을 입력해주세요");
		}

		ResultData<Integer> writeRecipeRd = recipeService.writeRecipe(rq.getLoginedMemberId(), title, body, categoryId,
				personnel, cookingTime, cookLevel, ingredients);

		int id = (int) writeRecipeRd.getData1();

		Recipe recipe = recipeService.getRecipe(id);

		Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();

		for (String fileInputName : fileMap.keySet()) {
			MultipartFile multipartFile = fileMap.get(fileInputName);

			if (multipartFile.isEmpty() == false) {
				genFileService.save(multipartFile, id);
			}
		}

		return Ut.jsReplace(writeRecipeRd.getResultCode(), writeRecipeRd.getMsg(), "../recipe/detail?id=" + id);

	}

}