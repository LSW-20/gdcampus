package com.br.gdcampus.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor     // 기본 생성자 생성
@AllArgsConstructor    // 모든 필드를 매개변수로 받는 생성자 생성
@Getter
@Setter
@ToString
public class MemberDto {

	private String userId = "B0001";
	
}
