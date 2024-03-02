package com.sla.project.repository;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface RecipeRepository {

	@Insert("""
			INSERT INTO
			recipe SET
			regDate = NOW(),
			updateDate = NOW(),
			memberId = #{memberId},
			title = #{title}, `body` = #{body},
			categoryId = #{categoryId}
			""")
	public void writeRecipe(int memberId, String title, String body, int categoryId);

	@Select("""
			SELECT LAST_INSERT_ID()
			""")
	public int getLastInsertId();
}
