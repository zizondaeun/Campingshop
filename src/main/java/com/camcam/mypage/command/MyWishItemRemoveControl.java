package com.camcam.mypage.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camcam.cart.service.CartService;
import com.camcam.cart.service.impl.CartServiceImpl;
import com.camcam.cart.vo.CartVO;
import com.camcam.common.Control;

public class MyWishItemRemoveControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uid = req.getParameter("uid");
		String pno = req.getParameter("pno");
		String cnt = req.getParameter("cnt");

		CartVO cart = new CartVO();

		cart.setUserId(uid);
		cart.setProductNo(Integer.parseInt(pno));
		cart.setQty(Integer.parseInt(cnt));
		
		CartService cartService = new CartServiceImpl();
		if(cartService.addCartDeleteWish(cart)) { 
			resp.getWriter().print("{\"retCode\": \"OK\"}");
		} else {
			resp.getWriter().print("{\"retCode\": \"NG\"}");
		}
	}

}
