package com.br.gdcampus.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
public class SecurityConfig {

	/** 비밀번호 암호화를 위해 빈으로 등록
	 * @return BcryptPasswordEncoder객체를 반환
	 * @author 김하늘
	 */
	@Bean
	BCryptPasswordEncoder bcryptPwdEncoder() {
		return new BCryptPasswordEncoder();
	}
}
