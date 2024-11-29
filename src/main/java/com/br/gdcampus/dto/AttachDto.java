package com.br.gdcampus.dto;

import java.sql.Date;

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
public class AttachDto {

	private String fileNo;
	private String equipNo;
	private String apprNo;
	private String postNo;
	private String filePath;
	private String filesystemName;
	private String originalName;
	private Date uploadDate;
	private String refType;
	
}
