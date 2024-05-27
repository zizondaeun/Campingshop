package com.camcam.product.service;

import java.util.List;
import java.util.Map;

import com.camcam.common.SearchVO;
import com.camcam.product.vo.ProductVO;

public interface ProductService {
	public List<ProductVO> recentProductList();
	
	public List<ProductVO> productList(SearchVO search);
	
	public int getTotal(SearchVO search);

	public ProductVO productInfo(int productNo);
	
	public List<Map<String, String>> categoryTemp();
	
	// 찜하기 관련
	public boolean getLikeVal(ProductVO product);
	public boolean addLike(ProductVO product);
	public boolean removeLike(ProductVO product);
}
