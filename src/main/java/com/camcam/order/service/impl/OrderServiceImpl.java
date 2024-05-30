package com.camcam.order.service.impl;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.camcam.common.DataSource;
import com.camcam.order.mapper.OrderMapper;
import com.camcam.order.service.OrderService;
import com.camcam.user.vo.UserVO;

public class OrderServiceImpl implements OrderService{
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

}
