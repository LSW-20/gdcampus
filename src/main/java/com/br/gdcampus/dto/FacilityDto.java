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
public class FacilityDto {

	private String facilityNo;
	private String facilityName;
	private String facilityCategory;
	private Date createDateTime;
	private String createUser;
	private Date updateDateTime;
	private String updateUser;
	private String status;
	
}
