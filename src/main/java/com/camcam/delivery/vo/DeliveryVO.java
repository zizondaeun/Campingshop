package com.camcam.delivery.vo;

import java.util.Date;

import lombok.Data;

@Data
public class DeliveryVO {
	private int deliNo;
	private String userId;
	private int orderNo;
	private Date deliDate;
	private int deliStatus;
}
