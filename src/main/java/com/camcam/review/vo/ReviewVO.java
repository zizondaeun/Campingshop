package com.camcam.review.vo;

import lombok.Data;

@Data
public class ReviewVO {
	// 리뷰 작성시 필요한 데이터
	private int replyNo; // 리뷰번호
	private String userId; // 리뷰 작성자
	private int productNo; // 리뷰 제품 번호
	private String content; // 리뷰
	private int rating; // 평점
	private String rdate; // 리뷰 작성일
	
	// 리뷰 조회시 필요한 데이터
	private int totalCnt; // 리뷰 개수
	private int sumRate; // 평점 총합
}
