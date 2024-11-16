package com.br.gdcampus.util;

import org.springframework.stereotype.Component;

import com.br.gdcampus.dto.PageInfoDto;

@Component
public class PagingUtil {
	public PageInfoDto getPageInfoDto(int listCount, int currentPage,int pageLimit, int postLimit) {
		int maxPage = (int)Math.ceil( (double)listCount / postLimit );
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		return PageInfoDto.builder()
						  .listCount(listCount)
						  .currentPage(currentPage)
						  .pageLimit(pageLimit)
						  .boardLimit(pageLimit)
						  .maxPage(maxPage)
						  .startPage(startPage)
						  .endPage(endPage)
						  .build();
	}
}
