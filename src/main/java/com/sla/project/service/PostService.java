package com.sla.project.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sla.project.repository.PostRepository;
import com.sla.project.vo.Post;

@Service
public class PostService {

	private final PostRepository postRepository;

	public PostService(PostRepository postRepository) {
		this.postRepository = postRepository;
	}

	// 여기서 title, body, post 싹다 빼고 imagefile만 업로드 가능한지 삽질해보기
	public void savePost(Post post, MultipartFile imageFile) throws IOException {
		// Save the post details
		// Handle image upload
		if (imageFile != null && !imageFile.isEmpty()) {
			String imagePath = "/uploads/" + UUID.randomUUID().toString() + "-" + imageFile.getOriginalFilename();
			Path imagePathOnDisk = Paths.get("/path/to/your/upload/directory" + imagePath);
			Files.createDirectories(imagePathOnDisk.getParent());
			Files.copy(imageFile.getInputStream(), imagePathOnDisk, StandardCopyOption.REPLACE_EXISTING);
			post.setImagePath(imagePath);
		}
		postRepository.save(post);
	}

	public Post getPost(Long id) {
		return postRepository.findById(id);
	}

	public List<Post> getAllPosts() {
		return postRepository.findAll();
	}
}
