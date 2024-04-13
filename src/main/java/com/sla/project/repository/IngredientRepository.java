package com.sla.project.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sla.project.vo.Ingredient;
import com.sla.project.vo.IngredientList;

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
			    <script>
			    INSERT INTO ingredient ( memberId, name ,nutrients, measure, recipeId)
			    VALUES
			    <foreach collection='ingredientList' item='item' separator=','>
			    (#{loginedMemberId}, #{item.name},'단백질',#{item.measure} ,#{item.recipeId})
			    </foreach>
			    </script>
			""")
	void writeIngredient(int loginedMemberId, List<Ingredient> ingredientList);

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
			SET name = #{ingredientName},
			updateDate = NOW()
			WHERE id = #{id}
				""")
	public void modifyIngredient(int id, String ingredientName);
}
