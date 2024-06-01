package com.camcam.common;

import lombok.Data;

@Data
public class SearchVO {
	private int page;
	private String searchCondition;
	private String keyword;
	private String sort;
	private String sortCondition;
	
	
	// 댓글관련
	private int boardNo;
	private int rpage;
	
	// 카테고리 관련
	private String categoryCode;
}
