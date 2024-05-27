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
import com.camcam.product.vo.ProductVO;

public class MyWishListControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = "mypage/mywishList.tiles";
		String id = req.getParameter("userId");
		if(id.equals("")) {
			HttpSession session = req.getSession();
			id = (String) session.getAttribute("logId");
		}
		
		MyPageService svc = new MyPageServiceImpl();
		List<ProductVO> list= svc.getMywish(id);
		req.setAttribute("list", list);
		
		req.getRequestDispatcher(path).forward(req, resp);
		//HttpUtils.forward(req, resp, path);
	}

}
