package com.camcam.product.mapper;

import java.util.List;
import java.util.Map;

import com.camcam.common.CategoryVO;
import com.camcam.common.SearchVO;
import com.camcam.product.vo.ProductVO;

public interface ProductMapper {
	// 홈화면 최근 등록물품 리스트 조회
	public List<ProductVO> selectRecentProduct();
	// 전체 제품 리스트 조회
	public List<ProductVO> selectProductList(SearchVO search);
	
	public List<ProductVO> productList();
	// 제품 상세조회
	public ProductVO selectProductInfo(int productNo);
	
	// getTotal(검색x)
	public int getTotal(SearchVO search);
	
	// 물품 카테고리 리스트
	public List<Map<String, String>> categoryTemp();
	
	// 메인페이지 대분류 카테고리 리스트, 해당 카테고리 상품 수 조회
	public List<CategoryVO> parentsCategoryList();
	
	// (관리자) 상품등록
	public int insertBoard(ProductVO product);
	
	// 상품카테고리 출력.
	public List<Map<String, String>> categoryList();
	
	// 찜하기 관련
	public int getLikeVal(ProductVO product);
	public int insertLike(ProductVO product); // 찜하기 추가
	public int deleteLike(ProductVO product); // 찜하기 제거
	public int insertWish(ProductVO vo); //관심상품 등록
}
