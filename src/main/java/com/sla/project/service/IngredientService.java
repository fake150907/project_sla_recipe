package com.sla.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sla.project.repository.IngredientRepository;
import com.sla.project.util.Ut;
import com.sla.project.vo.Ingredient;
import com.sla.project.vo.IngredientList;
import com.sla.project.vo.ResultData;

@Service
public class IngredientService {

	@Autowired
	private IngredientRepository ingredientRepository;

	public IngredientService(IngredientRepository ingredientRepository) {
		this.ingredientRepository = ingredientRepository;
	}

	public List<Ingredient> getForPrintIngredients(int loginedMemberId, int recipeId) {
		List<Ingredient> ingredients = ingredientRepository.getForPrintIngredients(loginedMemberId, recipeId);

		return ingredients;
	}

	public void writeIngredient(int loginedMemberId, IngredientList ingredients) {

		int id = ingredientRepository.getLastInsertId();
		
		ingredientRepository.writeIngredient(loginedMemberId, ingredients.getIngredients());

	}

	public ResultData userCanDelete(int loginedMemberId, Ingredient ingredient) {

		if (ingredient.getMemberId() != loginedMemberId) {
			return ResultData.from("F-2", Ut.f("%d번 댓글에 대한 삭제 권한이 없습니다", ingredient.getId()));
		}

		return ResultData.from("S-1", Ut.f("%d번 댓글이 삭제 되었습니다", ingredient.getId()));
	}

	public ResultData userCanModify(int loginedMemberId, Ingredient ingredient) {

		if (ingredient.getMemberId() != loginedMemberId) {
			return ResultData.from("F-2", Ut.f("%d번 댓글에 대한 수정 권한이 없습니다", ingredient.getId()));
		}

		return ResultData.from("S-1", Ut.f("%d번 댓글을 수정했습니다", ingredient.getId()));
	}

	public Ingredient getIngredient(int id) {
		return ingredientRepository.getIngredient(id);
	}

	public ResultData deleteIngredient(int id) {
		ingredientRepository.deleteIngredient(id);
		return ResultData.from("S-1", Ut.f("%d번 댓글을 삭제했습니다", id));
	}

	public void modifyIngredient(int id, String body) {
		ingredientRepository.modifyIngredient(id, body);
	}
}
