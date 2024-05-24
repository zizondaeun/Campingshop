package com.camcam.order.vo;

import lombok.Data;

@Data
public class OrderDetailVO {
	//orderdetail table
		private String orderDetailNo;
		private int orderNo;
		private String userId;
		private int quantity;
		private String productName;
		private int price;
		private int amount;
		
}
