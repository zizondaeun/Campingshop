package com.camcam.cart.mapper;

import java.util.List;

import com.camcam.cart.vo.CartVO;

public interface CartMapper {
	// 카트 목록
	List<CartVO> selectCartList();
	// 카트 수정
	int updateCart(CartVO cvo);
	// 카트 삭제
	int deleteCart(int productNo);
}
