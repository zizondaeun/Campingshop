package com.camcam.order.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.camcam.cart.service.CartService;
import com.camcam.cart.service.impl.CartServiceImpl;
import com.camcam.cart.vo.CartVO;
import com.camcam.common.Control;

public class OrderSuccessControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = "order/orderSuccess.tiles";

		HttpSession session = req.getSession();
		String userId = (String) session.getAttribute("logId");
		String prodNo = req.getParameter("productNo");

		CartService svc = new CartServiceImpl();

		String[] prodNoList = prodNo.split(",");

		for (int i = 0; i < prodNoList.length; i++) {
			CartVO cvo = new CartVO();
			cvo.setUserId(userId);
			cvo.setProductNo(Integer.parseInt(prodNoList[i]));

			svc.cleanCart(cvo);
		}

		req.getRequestDispatcher(path).forward(req, resp);

	}

}
