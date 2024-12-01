package com.br.gdcampus.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.br.gdcampus.interceptor.AdminCheckInterceptor;
import com.br.gdcampus.interceptor.LoginCheckInterceptor;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
	
	
	private final LoginCheckInterceptor loginCheckInterceptor;
	private final AdminCheckInterceptor adminCheckInterceptor;


	/**
	 * (스프링) servlet-context.xml의 <resources> 태그 설정 대신 정적 자원 경로를 매핑하는 메소드
	 * author : 상우 
	 */
	public void addResourceHandlers(ResourceHandlerRegistry registry) {

		registry.addResourceHandler("/resources/**")
				.addResourceLocations("classpath:/static/");
		
		// 첨부파일 조회할 때 
		// file:///upload/는 서버의 루트 디렉토리(C 드라이브 기준) 아래에 upload 폴더가 있다고 가정
		// <resources mapping="/upload/**" location="file:///upload/" /> 	
		registry.addResourceHandler("/upload/**")
				.addResourceLocations("file:///upload/"); 
		
	}
	
	
	// 인터셉터 등록 메소드
	public void addInterceptors(InterceptorRegistry registry) {
		
		// 로그인 체크 인터셉터
		registry.addInterceptor(loginCheckInterceptor)
				.addPathPatterns("/main2.do")
				.addPathPatterns("/user/profile/*");			
		
		// 관리자 체크 인터셉터(상우)
	    registry.addInterceptor(adminCheckInterceptor)
	    		.addPathPatterns("/equipmentAndFacility/list")
	    		.addPathPatterns("/reservation/approveReservation");
		
	}
	
}