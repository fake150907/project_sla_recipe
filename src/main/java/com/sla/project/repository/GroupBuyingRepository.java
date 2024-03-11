package com.sla.project.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sla.project.vo.GroupBuying;

@Mapper
public interface GroupBuyingRepository {
	@Insert("""
			INSERT INTO
			groupBuying SET
			regDate = NOW(),
			updateDate = NOW(),
			memberId = #{memberId},
			title = #{title},
			`body` = #{body},
			hashTag = #{hashTag},
			location = #{location}
			""")
	public void writeGroupBuying(int memberId, String title, String body, String hashTag, String location);

	@Select("SELECT LAST_INSERT_ID()")
	public int getLastInsertId();

	@Select("""
			SELECT *
			FROM groupBuying
			WHERE id = #{id}
			""")
	public GroupBuying getGroupBuying(int id);

	@Select("""
			SELECT G.*, M.nickname AS extra__writer
			FROM groupBuying G
			INNER JOIN `member` AS M
			ON G.memberId = M.id
			WHERE G.id = #{id}
				""")
	public GroupBuying getForPrintGroupBuying(int id);

	@Delete("DELETE FROM groupBuying WHERE id = #{id}")
	public void deleteGroupBuying(int id);

	@Update("""
			UPDATE groupBuying
				<set>
					<if test="title != null and title != ''">title = #{title},</if>
					<if test="body != null and body != ''">`body` = #{body},</if>
					updateDate = NOW()
				</set>
			WHERE id = #{id}
				""")
	public void modifyGroupBuying(int id, String title, String body);

	@Select("""
			SELECT G.*, M.nickname AS extra__writer
			FROM groupBuying G
			INNER JOIN `member` AS M
			ON G.memberId = M.id
			ORDER BY G.id DESC
			""")
	public List<GroupBuying> getGroupBuyings();

//	@Select("""
//			<script>
//			SELECT G.*, M.nickname AS extra__writer
//			FROM groupBuying G
//			INNER JOIN `member` AS M
//			ON G.memberId = M.id
//			WHERE 1
//			<if test="boardId != 0">
//				AND G.boardId = #{boardId}
//			</if>
//			ORDER BY G.id DESC
//			</script>
//			""")
//	public List<GroupBuying> getForPrintGroupBuyings(int boardId);

	@Select("""
			<script>
			SELECT COUNT(*) AS cnt
			FROM groupBuying G
			WHERE 1
			<if test="searchKeyword != ''">
				<choose>
					<when test="searchKeywordTypeCode == 'title'">
						AND G.title LIKE CONCAT('%',#{searchKeyword},'%')
					</when>
					<when test="searchKeywordTypeCode == 'body'">
						AND G.body LIKE CONCAT('%',#{searchKeyword},'%')
					</when>
					<otherwise>
						AND G.title LIKE CONCAT('%',#{searchKeyword},'%')
						OR G.body LIKE CONCAT('%',#{searchKeyword},'%')
					</otherwise>
				</choose>
			</if>
			ORDER BY id DESC
			</script>
			""")
	public int getGroupBuyingsCount(String searchKeywordTypeCode, String searchKeyword);

	@Update("""
			UPDATE groupBuying
			SET hitCount = hitCount + 1
			WHERE id = #{id}
			""")
	public int increaseHitCount(int id);

	@Select("""
			SELECT hitCount
			FROM groupBuying
			WHERE id = #{id}
			""")
	public int getGroupBuyingHitCount(int id);

	@Select("""
			<script>
			SELECT G.*, M.nickname AS extra__writer
			FROM groupBuying G
			INNER JOIN `member` AS M
			ON G.memberId = M.id
			WHERE 1
			<if test="searchKeyword != ''">
				<choose>
					<when test="searchKeywordTypeCode == 'title'">
						AND G.title LIKE CONCAT('%',#{searchKeyword},'%')
					</when>
					<when test="searchKeywordTypeCode == 'body'">
						AND G.body LIKE CONCAT('%',#{searchKeyword},'%')
					</when>
					<otherwise>
						AND G.title LIKE CONCAT('%',#{searchKeyword},'%')
						OR G.body LIKE CONCAT('%',#{searchKeyword},'%')
					</otherwise>
				</choose>
			</if>
			ORDER BY G.id DESC
			<if test="limitFrom >= 0 ">
				LIMIT #{limitFrom}, #{limitTake}
			</if>
			</script>
			""")
	public List<GroupBuying> getForPrintGroupBuyings(int limitFrom, int limitTake, String searchKeywordTypeCode,
			String searchKeyword);

	@Update("""
			UPDATE groupBuying
			SET goodReactionPoint = goodReactionPoint + 1
			WHERE id = #{id}
			""")
	public void increaseGoodRp(int id);

	@Update("""
			UPDATE groupBuying
			SET badReactionPoint = badReactionPoint + 1
			WHERE id = #{id}
			""")
	public void increaseBadRp(int id);

	@Update("""
			UPDATE groupBuying
			SET goodReactionPoint = goodReactionPoint - 1
			WHERE id = #{id}
			""")
	public void decreaseGoodRp(int id);

	@Update("""
			UPDATE groupBuying
			SET badReactionPoint = badReactionPoint - 1
			WHERE id = #{id}
			""")
	public void decreaseBadRp(int id);

	@Select("""
			SELECT goodReactionPoint
			FROM groupBuying
			WHERE id = #{id}
			""")
	public int getGoodRpCount(int id);

	@Select("""
			SELECT badReactionPoint
			FROM groupBuying
			WHERE id = #{id}
			""")
	public int getBadRqCount(int id);
}
