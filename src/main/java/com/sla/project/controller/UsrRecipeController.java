package com.sla.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sla.project.service.BoardService;
import com.sla.project.service.ReactionPointService;
import com.sla.project.service.RecipeService;
import com.sla.project.service.ReplyService;
import com.sla.project.util.Ut;
import com.sla.project.vo.Board;
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
	private ReactionPointService reactionPointService;
	@Autowired
	private UsrReplyController usrReplyController;
	@Autowired
	private ReplyService replyService;
	@Autowired
	private BoardService boardService;

	public UsrRecipeController() {

	}

	@RequestMapping("/usr/recipe/list")
	public String showList(HttpServletRequest req, Model model, @RequestParam(defaultValue = "1") int boardId,
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "title,body") String searchKeywordTypeCode,
			@RequestParam(defaultValue = "") String searchKeyword) {

		Rq rq = (Rq) req.getAttribute("rq");

		Board board = boardService.getBoardById(boardId);

		int recipesCount = recipeService.getRecipesCount(boardId, searchKeywordTypeCode, searchKeyword);

		if (board == null) {
			return rq.historyBackOnView("없는 게시판이야");
		}

		// 한페이지에 글 10개씩이야
		// 글 20개 -> 2 page
		// 글 24개 -> 3 page
		int itemsInAPage = 10;

		int pagesCount = (int) Math.ceil(recipesCount / (double) itemsInAPage);

		List<Recipe> recipes = recipeService.getForPrintRecipes(boardId, itemsInAPage, page, searchKeywordTypeCode,
				searchKeyword);

		model.addAttribute("board", board);
		model.addAttribute("boardId", boardId);
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

		Recipe recipe = recipeService.getForPrintRecipe(rq.getLoginedMemberId(), id);

		boolean isAlreadyAddrecipeGoodRp = reactionPointService.isAlreadyAddGoodRp(rq.getLoginedMemberId(), id,
				"recipe");
		boolean isAlreadyAddrecipeBadRp = reactionPointService.isAlreadyAddBadRp(rq.getLoginedMemberId(), id, "recipe");
		boolean isAlreadyAddReplyGoodRp = reactionPointService.isAlreadyAddGoodRp(rq.getLoginedMemberId(), id,
				"comment");
		boolean isAlreadyAddReplyBadRp = reactionPointService.isAlreadyAddBadRp(rq.getLoginedMemberId(), id, "comment");
		String relTypeCode = "Recipe";
		model.addAttribute("recipe", recipe);
		model.addAttribute("isLogined", rq.isLogined());
		model.addAttribute("isAlreadyAddrecipeGoodRp", isAlreadyAddrecipeGoodRp);
		model.addAttribute("isAlreadyAddrecipeBadRp", isAlreadyAddrecipeBadRp);
		model.addAttribute("isAlreadyAddReplyGoodRp", isAlreadyAddReplyGoodRp);
		model.addAttribute("isAlreadyAddReplyBadRp", isAlreadyAddReplyBadRp);
		model.addAttribute("Replies", usrReplyController.showReplyList(req, model, id, relTypeCode));
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
