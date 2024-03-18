package com.sla.project.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.web.multipart.MultipartFile;

import com.sla.project.vo.ImgTestFile;

@Mapper
public interface ImgTestFileRepository {

	@Select("""
			SELECT *
			FROM imgTestFile
			WHERE id = #{id}
			""")
	public ImgTestFile getImgTestFile(int id);

	public ImgTestFile save(ImgTestFile imgTestFile);

	@Insert("""
			<script>
			INSERT INTO imgTestFile
			SET original_file_name = #{original_file_name},
			imagepath = #{imagePath},
			file_size = #{file_size}
			</script>
			""")
	public void save(String original_file_name, String imagePath, long file_size);

}
