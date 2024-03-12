package com.sla.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sla.project.repository.RecipeRepository;
import com.sla.project.util.Ut;
import com.sla.project.vo.CookWare;
import com.sla.project.vo.Ingredient;
import com.sla.project.vo.Recipe;
import com.sla.project.vo.ResultData;

@Service
public class RecipeService {

	@Autowired
	private RecipeRepository recipeRepository;

	public RecipeService(RecipeRepository recipeRepository) {
		this.recipeRepository = recipeRepository;
	}

	// 서비스 메서드
	public Recipe getForPrintRecipe(int loginedMemberId, int id) {
		Recipe recipe = recipeRepository.getForPrintRecipe(id);

		controlForPrintData(loginedMemberId, recipe);

		return recipe;
	}

	// ingredient가져오는 메서드
	public List<Ingredient> getForPrintRecipeIngredient(int id) {
		List<Ingredient> ingredient = recipeRepository.getForPrintRecipeIngredient(id);

		return ingredient;
	}

	// cookWare가져오는 메서드
	public List<CookWare> getForPrintRecipeCookWare(int id) {
		List<CookWare> cookWare = recipeRepository.getForPrintRecipeCookWare(id);

		return cookWare;
	}

	private void controlForPrintData(int loginedMemberId, Recipe recipe) {
		if (recipe == null) {
			return;
		}
		ResultData userCanModifyRd = userCanModify(loginedMemberId, recipe);
		recipe.setUserCanModify(userCanModifyRd.isSuccess());

		ResultData userCanDeleteRd = userCanDelete(loginedMemberId, recipe);
		recipe.setUserCanDelete(userCanDeleteRd.isSuccess());
	}

	public ResultData userCanDelete(int loginedMemberId, Recipe recipe) {

		if (recipe.getMemberId() != loginedMemberId) {
			return ResultData.from("F-2", Ut.f("%d번 글에 대한 삭제 권한이 없습니다", recipe.getId()));
		}

		return ResultData.from("S-1", Ut.f("%d번 글이 삭제 되었습니다", recipe.getId()));
	}

	public ResultData userCanModify(int loginedMemberId, Recipe recipe) {

		if (recipe.getMemberId() != loginedMemberId) {
			return ResultData.from("F-2", Ut.f("%d번 글에 대한 수정 권한이 없습니다", recipe.getId()));
		}

		return ResultData.from("S-1", Ut.f("%d번 글을 수정했습니다", recipe.getId()));
	}

	public ResultData<Integer> writeRecipe(int memberId, String title, String body, int categoryId, int personnel,
			int cookingTime, int cookLevel) {

		recipeRepository.writeRecipe(memberId, title, body, categoryId, personnel, cookingTime, cookLevel);

		int id = recipeRepository.getLastInsertId();

		return ResultData.from("S-1", Ut.f("%d번 글이 생성되었습니다", id), "id", id);
	}

	public void deleterecipe(int id) {
		recipeRepository.deleteRecipe(id);
	}

	public void modifyrecipe(int id, String title, String body) {
		recipeRepository.modifyRecipe(id, title, body);
	}

	public Recipe getRecipe(int id) {
		return recipeRepository.getRecipe(id);
	}

	public List<Recipe> getRecipes() {
		return recipeRepository.getRecipes();
	}

	public int getRecipesCount(String searchKeywordTypeCode, String searchKeyword) {
		return recipeRepository.getRecipesCount(searchKeywordTypeCode, searchKeyword);
	}
//
//	public List<recipe> getForPrintRecipes(int boardId) {
//		return recipeRepository.getForPrintRecipes(boardId);
//	}

	public ResultData increaseHitCount(int id) {
		int affectedRow = recipeRepository.increaseHitCount(id);

		if (affectedRow == 0) {
			return ResultData.from("F-1", "해당 게시물 없음", "id", id);
		}

		return ResultData.from("S-1", "해당 게시물 조회수 증가", "id", id);

	}

	public Object getRecipeHitCount(int id) {
		return recipeRepository.getRecipeHitCount(id);
	}

	public List<Recipe> getForPrintRecipes(int itemsInAPage, int page, String searchKeywordTypeCode,
			String searchKeyword) {

//		SELECT * FROM recipe WHERE boardId = 1 ORDER BY id DESC LIMIT 0, 10; 1page
//		SELECT * FROM recipe WHERE boardId = 1 ORDER BY id DESC LIMIT 10, 10; 2page

		int limitFrom = (page - 1) * itemsInAPage;
		int limitTake = itemsInAPage;

		return recipeRepository.getForPrintRecipes(limitFrom, limitTake, searchKeywordTypeCode, searchKeyword);
	}

	public ResultData increaseGoodReactionPoint(int relId) {
		int affectedRow = recipeRepository.increaseGoodReactionPoint(relId);

		if (affectedRow == 0) {
			return ResultData.from("F-1", "없는 게시물");
		}

		return ResultData.from("S-1", "좋아요 증가", "affectedRow", affectedRow);
	}

	public ResultData increaseBadReactionPoint(int relId) {
		int affectedRow = recipeRepository.increaseBadReactionPoint(relId);

		if (affectedRow == 0) {
			return ResultData.from("F-1", "없는 게시물");
		}

		return ResultData.from("S-1", "싫어요 증가", "affectedRow", affectedRow);
	}

	public ResultData decreaseGoodReactionPoint(int relId) {
		int affectedRow = recipeRepository.decreaseGoodReactionPoint(relId);

		if (affectedRow == 0) {
			return ResultData.from("F-1", "없는 게시물");
		}

		return ResultData.from("S-1", "좋아요 감소", "affectedRow", affectedRow);
	}

	public ResultData decreaseBadReactionPoint(int relId) {
		int affectedRow = recipeRepository.decreaseBadReactionPoint(relId);

		if (affectedRow == 0) {
			return ResultData.from("F-1", "없는 게시물");
		}

		return ResultData.from("S-1", "싫어요 감소", "affectedRow", affectedRow);
	}

	public int getGoodRP(int relId) {
		return recipeRepository.getGoodRP(relId);
	}

	public int getBadRP(int relId) {
		return recipeRepository.getBadRP(relId);
	}

}