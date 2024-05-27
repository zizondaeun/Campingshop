package com.camcam.cart.vo;

import lombok.Data;

@Data
public class CartDetailVO {
	private int cartDetailNo; // 상세카트번호
	private int cartNo; // 카트번호
	private int productNo; // 상품번호
	private int quantity; // 양
	private int amount;  // 총금액
	
}
