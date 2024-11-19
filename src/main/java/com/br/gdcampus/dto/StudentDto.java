package com.br.gdcampus.dto;

import java.sql.Date;
import java.util.ArrayList;

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
public class StudentDto {
	
	private int stuNo;
	private String dept;
	private Date CreateDate;
	private String CreateUser;
	private Date updateDate;
	private String updateUser;
	private String stuName;
	private int status;
	private int grade;
	
	//다수의 학생 객체
	private ArrayList<StudentDto> studentList;
}