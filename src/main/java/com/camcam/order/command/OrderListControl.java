package com.camcam.order.command;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.camcam.common.Control;
import com.camcam.order.service.OrderService;
import com.camcam.order.service.impl.OrderServiceImpl;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class OrderListControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");
		HttpSession session = req.getSession();
		
		String userId = (String)session.getAttribute("logId");
		System.out.println("dddddddd" + userId);
		String cartNo = req.getParameter("cno");
		System.out.println("dddddddd" + cartNo);
		
		String[] cartNoNoList = cartNo.split(",");
		for (String string : cartNoNoList) {
			System.out.println("dddddddda"+string);
		}
		
		List<Map<String, Object>> list = new ArrayList<>();
		OrderService orderService = new OrderServiceImpl();
		
		for(int i=1; i<cartNoNoList.length; i++) {
			Map<String, Object> map = orderService.getCart(userId, Integer.parseInt(cartNoNoList[i]));
			list.add(map);
			System.out.println("ddd" + map);
		}
		
		Gson gson = new GsonBuilder().create();
		resp.getWriter().print(gson.toJson(list));	
		
	}

}
