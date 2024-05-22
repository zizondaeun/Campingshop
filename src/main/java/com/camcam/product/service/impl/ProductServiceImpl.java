package com.camcam.product.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.camcam.common.DataSource;
import com.camcam.product.mapper.ProductMapper;
import com.camcam.product.service.ProductService;
import com.camcam.product.vo.ProductVO;

public class ProductServiceImpl implements ProductService{

	SqlSession session = DataSource.getInstance().openSession(true);
	ProductMapper mapper = session.getMapper(ProductMapper.class);
	
	@Override
	public List<ProductVO> recentProductList() {
		return mapper.selectRecentProduct();
	}

	@Override
	public List<ProductVO> productList() {
		return mapper.selectProductList();
	}

}
