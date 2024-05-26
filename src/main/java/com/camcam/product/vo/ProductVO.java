package com.camcam.product.vo;

import lombok.Data;

@Data
public class ProductVO {
	private int productNo;
	private String categoryCode;
	private String productName;
	private int price;
	private int offPrice;
	private String explain;
	private String productImg;
	private int productCnt;
	private double rating;
	private String inputDate;
	
	private int reviewCnt;
	private double truncRating; // 소수점 이하 버린 평점
	
	private String userId;
	private int likeStatus; //좋아요없다 0, 좋아요했다 1
	
}
