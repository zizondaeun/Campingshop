package com.camcam.mypage.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.camcam.common.Control;
import com.camcam.mypage.service.MyPageService;
import com.camcam.mypage.service.impl.MyPageServiceImpl;
import com.camcam.order.vo.OrderVO;

public class MyOrderListControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = "mypage/myorderList.tiles";
		String id = req.getParameter("userId");
		if(id.equals("")) {
			HttpSession session = req.getSession();
			id = (String) session.getAttribute("logId");
		}
		
		MyPageService svc = new MyPageServiceImpl();
		List<OrderVO> list = svc.getMyorder(id);
		System.out.println(list);
		req.setAttribute("list", list);
		
		req.getRequestDispatcher(path).forward(req, resp);
	}

}
