package com.camcam.cart.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camcam.cart.service.impl.CartServiceImpl;
import com.camcam.common.Control;

public class RemoveCartControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String no = req.getParameter("no");
		
		CartServiceImpl cartService = new CartServiceImpl();
		
		if(cartService.removeCart(Integer.parseInt(no))) {
			resp.getWriter().print("{\"retCode\": \"OK\"}");
		} else {
			resp.getWriter().print("{\"retCode\": \"NG\"}");
		}
		

	}

}
