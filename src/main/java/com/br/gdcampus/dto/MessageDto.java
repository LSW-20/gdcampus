package com.br.gdcampus.dto;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class MessageDto {

	private String msgNo;
	private String msgContent;
	private String userNo;
	private String roomNo;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm") // java.sql.Date는 연월일만 가지고 있음. Timestamp형이 연월일시분초를 가지고 있음. 그리고 형식 변환용 어노테이션.
	private Timestamp createDateTime;
	private String status;
	
	private String userName;
	private String msgType;
}
