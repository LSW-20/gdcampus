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
public class ReservationDto {

	private String reservationNo;
	private String userNo;
	private String userName;
	private Date reservationDate;
	private String reservationReason;
	private String equipNo;
	private String facilityNo;
	private Date reservationRequestDate;
	private Date approvalRejectionDate;
	private String approvalRejectionUser;
	private String approvalRejectionReason;
	private String status;
	
	private String equipCategory;
	private String equipName;
	private String facilityCategory;
	private String facilityName;
	private String classification;
	
}
