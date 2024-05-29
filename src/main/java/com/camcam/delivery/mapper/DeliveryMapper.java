package com.camcam.delivery.mapper;

import java.util.List;

import com.camcam.delivery.vo.DeliveryVO;

public interface DeliveryMapper {
	
	// 배송 목록
	List<DeliveryVO> selectDeliveryList();
}
