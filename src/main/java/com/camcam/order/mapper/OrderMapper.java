package com.camcam.order.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface OrderMapper {

	
	Map<String, Object> selectCart(@Param("userId") String userId, @Param("productNo") int productNo);
	
	
}
