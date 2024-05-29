package com.camcam.cart.vo;

import lombok.Data;

@Data
public class CartVO {
	private int cartNo;
	private String userId;
	private int productNo;
	private String productName;
	private int price;
	private int qty;
	private String productImg;
	private int discount;
	
}
