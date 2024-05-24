package com.camcam.order.vo;

import lombok.Data;
import oracle.sql.DATE;

@Data
public class OrderVO {
	//orders table
	private int orderNo;
	private int cartNo;
	private String userId;
	private DATE orderDate;
	private String address;
	private int amount;
	private String orderStatus;
	
}
