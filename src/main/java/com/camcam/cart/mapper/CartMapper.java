package com.camcam.cart.mapper;

import java.util.List;

import com.camcam.cart.vo.CartVO;

public interface CartMapper {
	// 카트 목록
	List<CartVO> selectCartList(String userId);
	// 카트 수정
	int updateCart(CartVO cvo);
	// 카트 삭제
	int deleteCart(int cartNo);
	// 카트 등록
	int insertCart(CartVO cvo);
	// 유저가 해당 제품을 담은 이력이 있는지 확인
	int getUserToProductCnt(CartVO cvo);
}
