package com.camcam.cart.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.camcam.cart.mapper.CartMapper;
import com.camcam.cart.service.CartService;
import com.camcam.cart.vo.CartVO;
import com.camcam.common.DataSource;
import com.camcam.mypage.mapper.MyPageMapper;
import com.camcam.product.vo.ProductVO;

public class CartServiceImpl implements CartService{
	SqlSession session = DataSource.getInstance().openSession(true);
	CartMapper mapper = session.getMapper(CartMapper.class);
	MyPageMapper mypagemapper = session.getMapper(MyPageMapper.class);
	
	@Override
	public List<CartVO> cartList(String userId) {
		return mapper.selectCartList(userId);
	}


	@Override
	public boolean updateCart(CartVO cvo) {
		return mapper.updateCart(cvo) == 1;
	}


	@Override
	public boolean removeCart(int cartNo) {
		return mapper.deleteCart(cartNo) == 1;
	}


	@Override
	public boolean addCart(CartVO cvo) {
		return mapper.insertCart(cvo) == 1;
	}


	@Override
	public int getUserToProductCnt(CartVO cvo) {
		return mapper.getUserToProductCnt(cvo);
	}


	@Override
	public boolean addCartDeleteWish(CartVO cart) { //수량 올릴건지 새로 넣을건지 선택지
		List<CartVO> list = mapper.selectCartList(cart.getUserId());
		System.out.println(list);
		int cnt = 0;
		boolean check = true;
		for(CartVO vo : list) { //사용자가 미리 담아둔 아이템
			if(cart.getProductNo() == vo.getProductNo()) {
				mapper.updatePlusOne(cart);
				cnt++;
				System.out.println("1번째"+cnt);
				check = false;
				break;
			}
		}
		if(check) {
			mapper.insertCart(cart);
			cnt++;
			System.out.println("2번째"+cnt);
		}
		ProductVO vo = new ProductVO();
		vo.setUserId(cart.getUserId());
		vo.setProductNo(cart.getProductNo());
		mypagemapper.deleteMywish(vo);
		cnt++;
		System.out.println("3번째"+cnt);
		if(cnt == 2) {
			return true;
		}else {
			return false;
		}
	}


	@Override
	public boolean cleanCart(CartVO cart) {
		return mapper.cleanCart(cart) > 0;
	}


	@Override
	public int cartCnt(String userId) {
		return mapper.cartCnt(userId);
	}



}
