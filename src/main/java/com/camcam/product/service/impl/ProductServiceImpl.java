package com.camcam.product.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.camcam.common.DataSource;
import com.camcam.common.SearchVO;
import com.camcam.mypage.mapper.MyPageMapper;
import com.camcam.product.mapper.ProductMapper;
import com.camcam.product.service.ProductService;
import com.camcam.product.vo.ProductVO;

public class ProductServiceImpl implements ProductService{

	SqlSession session = DataSource.getInstance().openSession(true);
	ProductMapper mapper = session.getMapper(ProductMapper.class);
	MyPageMapper myWishMapper = session.getMapper(MyPageMapper.class);
	
	@Override
	public List<ProductVO> recentProductList() {
		return mapper.selectRecentProduct();
	}

	@Override
	public List<ProductVO> productList(SearchVO search) {
		return mapper.selectProductList(search);
	}

	@Override
	public int getTotal(SearchVO keyword) {
		return mapper.getTotal(keyword);
	}

	@Override
	public List<Map<String, String>> categoryTemp() {
		// TODO Auto-generated method stub
		return mapper.categoryTemp();
	}

	@Override
	public ProductVO productInfo(int productNo) {
		return mapper.selectProductInfo(productNo);
	}

	@Override
	public boolean getLikeVal(ProductVO product) {
		return mapper.getLikeVal(product) >= 1;
	}
	@Override
	public boolean addLike(ProductVO product) {
		return mapper.insertLike(product) == 1;
	}

	@Override
	public boolean removeLike(ProductVO product) {
		return mapper.deleteLike(product) == 1;
	}

	@Override
	public boolean addProduct(ProductVO product) {
		// TODO Auto-generated method stub
		return mapper.insertBoard(product) == 1;
	}

	@Override
	public List<Map<String, String>> categoryList() {
		return mapper.categoryList();
	}

	@Override
	public boolean addWish(ProductVO vo) {
		List<ProductVO> list = myWishMapper.selectMywish(vo);
		for (ProductVO prd : list) {
			if (prd.getProductNo() == vo.getProductNo()) {
				myWishMapper.deleteMywish(vo);
				return true;
			}
		}
		if (mapper.insertWish(vo) == 1) {
			return true;
		}
		return false;
	}


	
	

}
