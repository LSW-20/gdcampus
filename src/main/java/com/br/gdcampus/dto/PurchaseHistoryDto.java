package com.br.gdcampus.dto;
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
public class PurchaseHistoryDto {
	private String apprNo;
	private int productNo;
	private String productName;
	private String productUnit;
	private int productAmt;
	private String productPrice;
}
