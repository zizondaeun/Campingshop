package com.camcam.delivery.service;

import java.util.List;

import com.camcam.delivery.vo.DeliveryVO;

public interface DeliveryService {
	
	// 배송목록
	public List<DeliveryVO> deliveryList();
	// 배송 등록
	public boolean addDelivery(DeliveryVO dvo);
	
}
