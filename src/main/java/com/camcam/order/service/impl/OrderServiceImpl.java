package com.camcam.order.service.impl;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.camcam.common.DataSource;
import com.camcam.order.mapper.OrderMapper;
import com.camcam.order.service.OrderService;
import com.camcam.order.vo.OrderDetailVO;
import com.camcam.order.vo.OrderVO;
import com.camcam.product.vo.ProductVO;
import com.camcam.user.vo.UserVO;

public class OrderServiceImpl implements OrderService {
	SqlSession session = DataSource.getInstance().openSession(true);
	OrderMapper mapper = session.getMapper(OrderMapper.class);

	@Override
	public Map<String, Object> getCart(String userId, int cartNo) {
		return mapper.selectCart(userId, cartNo);
	}

	@Override
	public UserVO getUser(String userId) {
		return mapper.selectUser(userId);
	}

	@Override
	public boolean addOrder(OrderVO order) {
		return mapper.insertOrder(order) == 1;
	}

	@Override
	public int getOrderNo() {
		return mapper.selectOrderNo();
	}

	@Override
	public ProductVO getProductInfo(int productNo) {
		return mapper.selectProductInfo(productNo);
	}

	@Override
	public boolean addOrderDetail(OrderDetailVO orderDetail) {
		return mapper.insertOrderDetail(orderDetail) == 1;
	}

}
