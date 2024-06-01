package com.camcam.cart.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.camcam.cart.service.CartService;
import com.camcam.cart.service.impl.CartServiceImpl;
import com.camcam.common.Control;

public class UserCartCntControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");
		HttpSession session = req.getSession();
		String userId = (String) session.getAttribute("logId");
		
		CartService cartService = new CartServiceImpl();
		int cartCnt = cartService.cartCnt(userId);
		
		resp.getWriter().print("{\"retCode\":"+ cartCnt +"}");
		
	}

}
