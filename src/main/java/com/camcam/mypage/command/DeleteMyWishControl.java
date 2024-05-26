package com.camcam.mypage.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camcam.common.Control;
import com.camcam.mypage.service.MyPageService;
import com.camcam.mypage.service.impl.MyPageServiceImpl;
import com.camcam.product.vo.ProductVO;

public class DeleteMyWishControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");
		
		String id = req.getParameter("userId");
		String pno = req. getParameter("productNo");
		
		MyPageService svc = new MyPageServiceImpl();
		ProductVO vo = new ProductVO();
		vo.setUserId(id);
		vo.setProductNo(Integer.parseInt(pno));
		if(svc.removeMywish(vo)){
			resp.sendRedirect("myWishList.do");
		}else {
			resp.sendRedirect("error.do");
		}
	}

}
