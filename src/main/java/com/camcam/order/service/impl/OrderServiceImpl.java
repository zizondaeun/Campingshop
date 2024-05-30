package com.camcam.order.service.impl;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.camcam.common.DataSource;
import com.camcam.order.mapper.OrderMapper;

public class OrderServiceImpl implements OrderService{
	SqlSession session = DataSource.getInstance().openSession(true);
	OrderMapper mapper = session.getMapper(OrderMapper.class);
	
	@Override
	public Map<String, Object> getCart(String userId, int productNo) {
		return mapper.selectCart(userId, productNo);
	}

}
