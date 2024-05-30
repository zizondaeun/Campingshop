package com.camcam.order.service.impl;

import java.util.Map;

public interface OrderService {
	Map<String, Object> getCart(String userId, int productNo);
	
	
	
}
