package com.sla.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sla.project.repository.RecipeRepository;
import com.sla.project.util.Ut;
import com.sla.project.vo.Recipe;
import com.sla.project.vo.ResultData;

@Service
public class RecipeService {

	@Autowired
	private RecipeRepository recipeRepository;

	public Recipe getRecipe(int id) {

		return null;
	}

	public ResultData<Integer> writeRecipe(int loginedMemberId, String title, String body, int categoryId) {
		recipeRepository.writeRecipe(loginedMemberId, title, body, categoryId);

		int id = recipeRepository.getLastInsertId();

		return ResultData.from("S-1", Ut.f("%d번 글이 생성되었습니다", id), "id", id);
	}

}
