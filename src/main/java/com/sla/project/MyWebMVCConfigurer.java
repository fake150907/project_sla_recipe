package com.sla.project;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.sla.project.interceptor.BeforeActionInterceptor;
import com.sla.project.interceptor.NeedLoginInterceptor;
import com.sla.project.interceptor.NeedLogoutInterceptor;

@Configuration
public class MyWebMVCConfigurer implements WebMvcConfigurer {

	// BeforeActionInterceptor 불러오기(연결)
	@Autowired
	BeforeActionInterceptor beforeActionInterceptor;

	// NeedLoginInterceptor 불러오기(연결)
	@Autowired
	NeedLoginInterceptor needLoginInterceptor;

	// NeedLogoutInterceptor 불러오기(연결)
	@Autowired
	NeedLogoutInterceptor needLogoutInterceptor;

	@Value("${custom.genFileDirPath}")
	private String genFileDirPath;

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/gen/**").addResourceLocations("file:///" + genFileDirPath + "/")
				.setCachePeriod(20);
	}

	// 인터셉터 등록(적용)
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(beforeActionInterceptor).addPathPatterns("/**").excludePathPatterns("/resource/**")
				.excludePathPatterns("/error");

		registry.addInterceptor(needLoginInterceptor).addPathPatterns("/usr/recipe/write")
		.addPathPatterns("/usr/recipe/doWrite").addPathPatterns("/usr/recipe/modify")
		.addPathPatterns("/usr/recipe/doModify").addPathPatterns("/usr/recipe/doDelete");
		
		registry.addInterceptor(needLoginInterceptor).addPathPatterns("/usr/groupBuying/write")
		.addPathPatterns("/usr/groupBuying/doWrite").addPathPatterns("/usr/groupBuying/modify")
		.addPathPatterns("/usr/groupBuying/doModify").addPathPatterns("/usr/groupBuying/doDelete");

		registry.addInterceptor(needLogoutInterceptor).addPathPatterns("/usr/member/login")
				.addPathPatterns("/usr/member/doLogin").addPathPatterns("/usr/member/join")
				.addPathPatterns("/usr/member/doJoin");
	}

}