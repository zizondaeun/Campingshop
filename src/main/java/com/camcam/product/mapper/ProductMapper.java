package com.camcam.product.mapper;

import java.util.List;

import com.camcam.product.vo.ProductVO;

public interface ProductMapper {
	// 홈화면 최근 등록물품 리스트 조회
	public List<ProductVO> selectRecentProduct();
	// 전체 상품 리스트 조회
	public List<ProductVO> selectProductList();
	// getTotal(검색x)
	public int getTotal();
}
