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
public class EquipmentDto {

	private String equipNo;
	private String equipName;
	private String equipCategory;
	private Date createDateTime;
	private String createUser;
	private Date updateDateTime;
	private String updateUser;
	private String status;
	
}
