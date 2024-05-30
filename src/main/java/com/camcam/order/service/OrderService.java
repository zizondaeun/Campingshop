package com.camcam.order.service;

import java.util.Map;

import com.camcam.user.vo.UserVO;

public interface OrderService {
	Map<String, Object> getCart(String userId, int cartNo);
	UserVO getUser(String userId);
	
	
}
