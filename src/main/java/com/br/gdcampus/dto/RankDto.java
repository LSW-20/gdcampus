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
public class RankDto {
	private String rankNo;
	private Date createDt;
	private String createUser;
	private Date modifyDt;
	private String modifyUser;
	private String rankName;
}
