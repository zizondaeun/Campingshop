package com.camcam.cart.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.camcam.cart.vo.CartVO;

public interface CartMapper {
	// 카트 목록
	List<CartVO> selectCartList(String userId);
	// 카트 수정
	int updateCart(CartVO cvo);
	// 카트 삭제
	int deleteCart(int productNo);
}
