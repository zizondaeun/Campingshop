package com.camcam.product.service;

import java.util.List;
import java.util.Map;

import com.camcam.common.CategoryVO;
import com.camcam.common.SearchVO;
import com.camcam.product.vo.ProductVO;

public interface ProductService {
	public List<ProductVO> recentProductList();

	public List<ProductVO> productList(SearchVO search);

	public int getTotal(SearchVO search);

	public ProductVO productInfo(int productNo);

	public List<Map<String, String>> categoryTemp();
	
	// 메인페이지 대분류 카테고리 리스트, 해당 카테고리 상품 수 조회
	public List<CategoryVO> parentsCategoryList();

	boolean addProduct(ProductVO product);

	public List<Map<String, String>> categoryList();

	// 찜하기 관련
	public boolean getLikeVal(ProductVO product);

	public boolean addLike(ProductVO product);

	public boolean removeLike(ProductVO product);

	public boolean addWish(ProductVO vo);
}
