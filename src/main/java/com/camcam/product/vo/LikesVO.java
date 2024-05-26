package com.camcam.product.vo;

import lombok.Data;

@Data
public class LikesVO {
	private String userId;
	private int productNo;
	private int likeStatus; //좋아요없다 0, 좋아요했다 1
}
