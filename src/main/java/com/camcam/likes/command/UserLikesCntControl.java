package com.camcam.likes.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.camcam.common.Control;
import com.camcam.likes.service.LikesService;
import com.camcam.likes.service.impl.LikeServiceImpl;
import com.camcam.product.vo.ProductVO;

public class UserLikesCntControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");
		HttpSession session = req.getSession();
		String userId = (String) session.getAttribute("logId");
		String productNo = req.getParameter("pno");
		
		LikesService likeService = new LikeServiceImpl();
		ProductVO product = new ProductVO();
		product.setUserId(userId);
		product.setProductNo(Integer.parseInt(productNo));
		
		int userLikeCnt = likeService.getUserLikeCnt(product);
		
		resp.getWriter().print("{\"userLikeCnt\":" + userLikeCnt + "}");
	}

}
