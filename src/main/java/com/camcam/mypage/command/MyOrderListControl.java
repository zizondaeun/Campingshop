package com.camcam.mypage.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.camcam.common.Control;
import com.camcam.common.PageDTO;
import com.camcam.mypage.service.MyPageService;
import com.camcam.mypage.service.impl.MyPageServiceImpl;
import com.camcam.mypage.vo.PageVO;
import com.camcam.order.vo.OrderVO;

public class MyOrderListControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String path = "mypage/myorderList.tiles";
		String id = (String) session.getAttribute("logId");
		String page = req.getParameter("page");
		if(id.equals("")) {
			id = (String) session.getAttribute("logId");
		}
		
		MyPageService svc = new MyPageServiceImpl();
		page = page == null ? "1" : page;
		PageVO vo = new PageVO();
		vo.setUserId(id);
		vo.setPage(Integer.parseInt(page));
		
		List<OrderVO> list = svc.getMyorder(vo);
		
		PageDTO pageDTO = new PageDTO(Integer.parseInt(page), svc.getOrderTotal(vo)); 
		req.setAttribute("list", list);
		req.setAttribute("paging", pageDTO);
		
		req.getRequestDispatcher(path).forward(req, resp);
	}

}
