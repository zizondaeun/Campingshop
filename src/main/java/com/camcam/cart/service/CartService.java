package com.camcam.cart.service;

import java.util.List;

import com.camcam.cart.vo.CartVO;

public interface CartService {
	List<CartVO> cartList(String userId);
	boolean updateCart(CartVO cvo);
	boolean removeCart(int cartNo);
	boolean addCart(CartVO cvo);
}
