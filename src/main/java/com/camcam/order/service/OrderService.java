package com.camcam.order.service;

import java.util.Map;

import com.camcam.order.vo.OrderDetailVO;
import com.camcam.order.vo.OrderVO;
import com.camcam.product.vo.ProductVO;
import com.camcam.user.vo.UserVO;

public interface OrderService {
	Map<String, Object> getCart(String userId, int cartNo);
	UserVO getUser(String userId);
	boolean addOrder(OrderVO order);
	int getOrderNo();
	ProductVO getProductInfo(int productNo);
	boolean addOrderDetail(OrderDetailVO orderDetail);
	
}
