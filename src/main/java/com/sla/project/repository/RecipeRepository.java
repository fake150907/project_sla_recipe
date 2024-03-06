package com.sla.project.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sla.project.vo.Recipe;

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

	@Select("""
			SELECT *
			FROM recipe
			WHERE id = #{id}
			""")
	public Recipe getRecipe(int id);

	@Select("""
			<script>
				SELECT R.*, M.nickname AS extra__writer
				FROM recipe AS R
				INNER JOIN `member` AS M
				ON R.memberId = M.id
				WHERE R.id = #{id}
				GROUP BY R.id
			</script>
				""")
	public Recipe getForPrintRecipe(int id);

	@Delete("DELETE FROM recipe WHERE id = #{id}")
	public void deleteRecipe(int id);

	@Update("""
			<script>
			UPDATE recipe
				<set>
					<if test="title != null and title != ''">title = #{title},</if>
					<if test="body != null and body != ''">`body` = #{body},</if>
					updateDate = NOW()
				</set>
			WHERE id = #{id}
			</script>
				""")
	public void modifyRecipe(int id, String title, String body);

	@Select("""
			SELECT R.*, M.nickname AS extra__writer
			FROM recipe AS R
			INNER JOIN `member` AS M
			ON R.memberId = M.id
			ORDER BY R.id DESC
			""")
	public List<Recipe> getRecipes();

//	@Select("""
//			<script>
//			SELECT R.*, M.nickname AS extra__writer
//			FROM recipe AS R
//			INNER JOIN `member` AS M
//			ON R.memberId = M.id
//			WHERE 1
//			<if test="boardId != 0">
//				AND R.boardId = #{boardId}
//			</if>
//			ORDER BY R.id DESC
//			</script>
//			""")
//	public List<Recipe> getForPrintRecipes(int boardId);

	@Select("""
			<script>
			SELECT COUNT(*) AS cnt
			FROM recipe AS R
			WHERE 1
			<if test="searchKeyword != ''">
				<choose>
					<when test="searchKeywordTypeCode == 'title'">
						AND R.title LIKE CONCAT('%',#{searchKeyword},'%')
					</when>
					<when test="searchKeywordTypeCode == 'body'">
						AND R.body LIKE CONCAT('%',#{searchKeyword},'%')
					</when>
					<otherwise>
						AND R.title LIKE CONCAT('%',#{searchKeyword},'%')
						OR R.body LIKE CONCAT('%',#{searchKeyword},'%')
					</otherwise>
				</choose>
			</if>
			ORDER BY id DESC
			</script>
			""")
	public int getRecipesCount(String searchKeywordTypeCode, String searchKeyword);

	@Update("""
			UPDATE recipe
			SET hitCount = hitCount + 1
			WHERE id = #{id}
			""")
	public int increaseHitCount(int id);

	@Select("""
			SELECT hitCount
			FROM recipe
			WHERE id = #{id}
			""")
	public int getRecipeHitCount(int id);

	@Select("""
			<script>
			SELECT R.*, M.nickname AS extra__writer, IFNULL(COUNT(R.id),0) AS extra__repliesCnt
			FROM recipe AS R
			INNER JOIN `member` AS M
			ON R.memberId = M.id
			LEFT JOIN `reply` AS RP
			ON R.id = RP.relId
			WHERE 1
			<if test="searchKeyword != ''">
				<choose>
					<when test="searchKeywordTypeCode == 'title'">
						AND R.title LIKE CONCAT('%',#{searchKeyword},'%')
					</when>
					<when test="searchKeywordTypeCode == 'body'">
						AND R.body LIKE CONCAT('%',#{searchKeyword},'%')
					</when>
					<otherwise>
						AND R.title LIKE CONCAT('%',#{searchKeyword},'%')
						OR R.body LIKE CONCAT('%',#{searchKeyword},'%')
					</otherwise>
				</choose>
			</if>
			GROUP BY R.id
			ORDER BY R.id DESC
			<if test="limitFrom >= 0 ">
				LIMIT #{limitFrom}, #{limitTake}
			</if>
			</script>
			""")
	public List<Recipe> getForPrintRecipes(int limitFrom, int limitTake, String searchKeywordTypeCode,
			String searchKeyword);

	@Update("""
			UPDATE recipe
			SET goodReactionPoint = goodReactionPoint + 1
			WHERE id = #{relId}
			""")
	public int increaseGoodReactionPoint(int relId);

	@Update("""
			UPDATE recipe
			SET goodReactionPoint = goodReactionPoint - 1
			WHERE id = #{relId}
			""")
	public int decreaseGoodReactionPoint(int relId);

	@Update("""
			UPDATE recipe
			SET badReactionPoint = badReactionPoint + 1
			WHERE id = #{relId}
			""")
	public int increaseBadReactionPoint(int relId);

	@Update("""
			UPDATE recipe
			SET badReactionPoint = badReactionPoint - 1
			WHERE id = #{relId}
			""")
	public int decreaseBadReactionPoint(int relId);

	@Select("""
			SELECT goodReactionPoint
			FROM recipe
			WHERE id = #{relId}
			""")
	public int getGoodRP(int relId);

	@Select("""
			SELECT badReactionPoint
			FROM recipe
			WHERE id = #{relId}
			""")
	public int getBadRP(int relId);
}
