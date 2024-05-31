package com.camcam.delivery.mapper;

import java.util.List;

import com.camcam.delivery.vo.DeliveryVO;

public interface DeliveryMapper {
	
	// 배송 목록
	List<DeliveryVO> selectDeliveryList();
	
	int updateDelivery(int deliNo);
	
	// 배송 등록
	int insertDelivery(DeliveryVO dvo);
}
