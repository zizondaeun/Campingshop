package com.camcam.order.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.camcam.common.Control;
import com.camcam.order.service.OrderService;
import com.camcam.order.service.impl.OrderServiceImpl;
import com.camcam.user.vo.UserVO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class OrderInfoControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");
		
		HttpSession session = req.getSession();
		String userId = (String) session.getAttribute("logId");
		
		OrderService orderService = new OrderServiceImpl();
		
		UserVO user = orderService.getUser(userId);
		
		Gson gson = new GsonBuilder().create();
		resp.getWriter().print(gson.toJson(user));
	}

}
