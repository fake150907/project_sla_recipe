package com.sla.project.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.sla.project.service.PostService;
import com.sla.project.vo.Post;

@Controller
public class PostController {

	private final PostService postService;

	public PostController(PostService postService) {
		this.postService = postService;
	}

	@GetMapping("/usr/home/posts")
	public String getAllPosts(Model model) {
		List<Post> posts = postService.getAllPosts();
		model.addAttribute("posts", posts);
		return "posts";
	}

	@GetMapping("/usr/home/post")
	public String getPost(@PathVariable Long id, Model model) {
		Post post = postService.getPost(id);
		model.addAttribute("post", post);
		return "post";
	}

	@RequestMapping("/usr/home/postWrite")
	public String showPost() {

		return "/usr/home/posts";
	}

	@PostMapping("/usr/home/postDoWrite")
	public String createPost(@RequestParam("imageFile") MultipartFile imageFile)
			throws IOException {
		postService.savePost(imageFile);
		return "redirect:/usr/home/post";
	}
}