package com.camcam.cart.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camcam.cart.service.CartService;
import com.camcam.cart.service.impl.CartServiceImpl;
import com.camcam.cart.vo.CartVO;
import com.camcam.common.Control;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class GetCartListControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");
		String uid = req.getParameter("uid");
		
		System.out.println("dkdkkdkdkdk"+ uid);
		
		CartService cartservice = new CartServiceImpl();
		
		List<CartVO> cartList = cartservice.cartList(uid);
		
		for (CartVO cartVO : cartList) {
			if(cartVO.getDiscount() == cartVO.getPrice()) {
				cartVO.setDiscount(0);
			}
		}
		
		
		Gson gson = new GsonBuilder().create();
		resp.getWriter().print(gson.toJson(cartList));
	}

}
