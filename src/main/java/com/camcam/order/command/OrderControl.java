package com.camcam.order.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camcam.common.Control;

public class OrderControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = "order/order.tiles";
		
		String cno = req.getParameter("cno");
		String cnt = req.getParameter("cnt");
		
		req.setAttribute("cartNo", cno);
		req.setAttribute("cnt", cnt);
		
		req.getRequestDispatcher(path).forward(req, resp);
	}

}
