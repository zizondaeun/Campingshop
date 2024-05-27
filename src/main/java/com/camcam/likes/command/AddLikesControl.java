package com.camcam.likes.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camcam.common.Control;
import com.camcam.product.vo.ProductVO;

public class AddLikesControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		// 넘어와야할 파라미터 : pno, user
		String pno = req.getParameter("pno");
		String uid = req.getParameter("uid");
		String likeStatus = req.getParameter("status");
		
		
		
		
	}

}
