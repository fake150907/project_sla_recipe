package com.sla.project.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sla.project.vo.CookWare;

@Mapper
public interface CookWareRepository {
	@Select("""
				SELECT *
				FROM cookWare
				WHERE recipeId = #{relId}
				AND memberId = #{loginedMemberId}
				ORDER BY R.id ASC;
			""")
	List<CookWare> getForPrintCookWares(int loginedMemberId, int relId);

	@Insert("""
			    <script>
			    INSERT INTO cookWare ( memberId, name, count, recipeId)
			    VALUES
			    <foreach collection='cookWareList' item='item' separator=','>
			    (#{loginedMemberId}, #{item.name},#{item.count} ,#{item.recipeId})
			    </foreach>
			    </script>
			""")
	void writeCookWare(int loginedMemberId, List<CookWare> cookWareList);

	@Select("SELECT LAST_INSERT_ID()")
	public int getLastInsertId();

	@Select("""
				SELECT R.*
				FROM cookWare AS R
				WHERE R.id = #{id}
			""")
	CookWare getCookWare(int id);

	@Delete("""
				DELETE FROM cookWare
				WHERE id = #{id}
			""")
	void deleteCookWare(int id);

	@Update("""
			UPDATE cookWare
			SET `name` = #{cookWareName},
			updateDate = NOW()
			WHERE id = #{id}
				""")
	public void modifyCookWare(int id, String cookWareName);
}
