package com.camcam.product.mapper;

import java.util.List;
import java.util.Map;

import com.camcam.common.SearchVO;
import com.camcam.product.vo.ProductVO;

public interface ProductMapper {
	// 홈화면 최근 등록물품 리스트 조회
	public List<ProductVO> selectRecentProduct();
	// 전체 상품 리스트 조회
	public List<ProductVO> selectProductList(SearchVO search);
	// getTotal(검색x)
	public int getTotal(SearchVO search);
	
	// 물품 카테고리 리스트
//	public List<CategoryVO> selectCategoryList();
	
	public List<Map<String, String>> categoryTemp();
}
