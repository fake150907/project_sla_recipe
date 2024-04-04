package com.sla.project.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sla.project.vo.Ingredient;

@Mapper
public interface IngredientRepository {

	@Select("""
				SELECT *
				FROM ingredient
				WHERE recipeId = #{relId}
				AND memberId = #{loginedMemberId}
				ORDER BY R.id ASC;
			""")
	List<Ingredient> getForPrintIngredients(int loginedMemberId, int relId);

	@Insert("""
				INSERT INTO ingredient
				SET regDate = NOW(),
				updateDate = NOW(),
				memberId = #{loginedMemberId},
				ingredientName = #{ingredientName},
				ingredientMeasure = #{ingredientMeasure},
				recipeId = #{recipeId}
			""")
	void writeIngredient(int loginedMemberId, String ingredientName, String ingredientMeasure, int recipeId);

	@Select("SELECT LAST_INSERT_ID()")
	public int getLastInsertId();

	@Select("""
				SELECT R.*
				FROM ingredient AS R
				WHERE R.id = #{id}
			""")
	Ingredient getIngredient(int id);

	@Delete("""
				DELETE FROM ingredient
				WHERE id = #{id}
			""")
	void deleteIngredient(int id);

	@Update("""
			UPDATE ingredient
			SET ingredientName = #{ingredientName},
			updateDate = NOW()
			WHERE id = #{id}
				""")
	public void modifyIngredient(int id, String ingredientName);
}
