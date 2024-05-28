package com.camcam.cart.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.camcam.cart.mapper.CartMapper;
import com.camcam.cart.service.CartService;
import com.camcam.cart.vo.CartVO;
import com.camcam.common.DataSource;

public class CartServiceImpl implements CartService{
	SqlSession session = DataSource.getInstance().openSession(true);
	CartMapper mapper = session.getMapper(CartMapper.class);
	
	
	@Override
	public List<CartVO> cartList(String userId) {
		return mapper.selectCartList(userId);
	}

}
