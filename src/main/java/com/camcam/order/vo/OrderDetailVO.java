package com.camcam.order.vo;

import lombok.Data;

@Data
public class OrderDetailVO {
	//orderdetail table
		private String orderDetailNo;
		private int quantity;
		private String productName;
		private int price;
}
