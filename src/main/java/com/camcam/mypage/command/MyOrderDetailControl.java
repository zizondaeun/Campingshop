package com.camcam.mypage.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camcam.common.Control;
import com.camcam.mypage.service.MyPageService;
import com.camcam.mypage.service.impl.MyPageServiceImpl;
import com.camcam.order.vo.OrderDetailVO;

public class MyOrderDetailControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = "mypage/myorderDetail.tiles";
		String ono = req.getParameter("ono");
		
		MyPageService svc = new MyPageServiceImpl();
		List<OrderDetailVO> list = svc.getOrderDetail(Integer.parseInt(ono));
		
		req.setAttribute("list", list);
		
		req.getRequestDispatcher(path).forward(req, resp);		
	}

}
