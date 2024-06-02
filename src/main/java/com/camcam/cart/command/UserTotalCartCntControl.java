package com.camcam.cart.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.camcam.cart.service.CartService;
import com.camcam.cart.service.impl.CartServiceImpl;
import com.camcam.cart.vo.CartVO;
import com.camcam.common.Control;

public class UserTotalCartCntControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String userId = (String) session.getAttribute("logId");
		String pno = req.getParameter("pno");
		
		
		CartVO cart = new CartVO();
		
		cart.setUserId(userId);
		cart.setProductNo(Integer.parseInt(pno));
		
		CartService cartService = new CartServiceImpl();
		
		int userToProductCnt = cartService.getUserToProductCnt(cart);
		
		resp.getWriter().print("{\"userToProductCnt\":" + userToProductCnt + "}");
		
		
		
	}

}
