package com.camcam.product.service;

import java.util.List;

import com.camcam.product.vo.ProductVO;

public interface ProductService {
	public List<ProductVO> recentProductList();
	
	public List<ProductVO> productList(int page);
	
	public int getTotal();
}
