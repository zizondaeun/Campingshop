package com.camcam.product.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.camcam.common.Control;
import com.camcam.product.service.ProductService;
import com.camcam.product.service.impl.ProductServiceImpl;
import com.camcam.product.vo.ProductVO;

public class AddWishControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String pno = req.getParameter("pno");
		String id = (String) session.getAttribute("logId");
		if(id == null) {
			resp.sendRedirect("logForm.do");
			return;
		}
		
		ProductVO vo = new ProductVO();
		vo.setProductNo(Integer.parseInt(pno));
		vo.setUserId(id);
		
		ProductService svc = new ProductServiceImpl();
		
		if(svc.addWish(vo)) {
			resp.sendRedirect("myWishList.do");
		}else {
			resp.sendRedirect("home.do");
		}
		
	}

}
