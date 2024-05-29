package com.camcam.order.vo;

import java.util.Date;

import lombok.Data;

@Data
public class OrderVO {
	private int orderNo; //
	private int cartNo; 
	private String userId; //
	private Date orderDate; //
	private String address; //
	private int amount; //
	private String orderStatus; //
	
}
