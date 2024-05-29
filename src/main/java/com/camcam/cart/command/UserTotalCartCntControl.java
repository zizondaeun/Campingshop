package com.camcam.cart.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camcam.cart.service.CartService;
import com.camcam.cart.service.impl.CartServiceImpl;
import com.camcam.cart.vo.CartVO;
import com.camcam.common.Control;

public class UserTotalCartCntControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uid = req.getParameter("uid");
		String pno = req.getParameter("pno");
		
		
		CartVO cart = new CartVO();
		
		cart.setUserId(uid);
		cart.setProductNo(Integer.parseInt(pno));
		
		CartService cartService = new CartServiceImpl();
		
		int userToProductCnt = cartService.getUserToProductCnt(cart);
		
		resp.getWriter().print("{\"userToProductCnt\":" + userToProductCnt + "}");
		
		
		
	}

}
