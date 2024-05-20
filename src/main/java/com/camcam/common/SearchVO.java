package com.camcam.common;

import lombok.Data;

@Data
public class SearchVO {
	private int page;
	private String searchCondition;
	private String keyword;
	
	// 댓글관련
	private int boardNo;
	private int rpage;
}
