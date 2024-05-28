package com.camcam.cart.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camcam.cart.service.CartService;
import com.camcam.cart.service.impl.CartServiceImpl;
import com.camcam.cart.vo.CartVO;
import com.camcam.common.Control;

public class ModifyCartControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String no = req.getParameter("no");
		String qty = req.getParameter("qty");
		
		CartVO cvo = new CartVO();
		cvo.setCartNo(Integer.parseInt(no));
		cvo.setQty(Integer.parseInt(qty));
		
		CartService svc = new CartServiceImpl();
		
		if(svc.updateCart(cvo)) {
			resp.getWriter().print("{\"retCode\": \"OK\"}");
		} else {
			resp.getWriter().print("{\"retCode\": \"NG\"}");
		}
		
		

	}

}
