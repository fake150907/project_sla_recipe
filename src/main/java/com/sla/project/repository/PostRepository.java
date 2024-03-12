package com.sla.project.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.sla.project.vo.Post;

@Mapper
public interface PostRepository {
	@Insert("""
			<script>
			INSERT INTO posts
			SET title = #{post.title},
			content = #{post.content},
			imagepath = #{imagePath}
			</script>
			""")
	void save(Post post);

	@Select("""
			SELECT * FROM posts
			WHERE id = #{id}
			""")
	Post findById(Long id);

	@Select("""
			SELECT * FROM posts
			""")
	List<Post> findAll();
	// Other methods if needed
}
