package com.camcam.review.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.camcam.common.Control;
import com.camcam.review.service.ReviewService;
import com.camcam.review.service.impl.ReviewServiceImpl;
import com.camcam.review.vo.ReviewVO;

public class UserReviewCountControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");
		HttpSession session = req.getSession();
		String userId = (String) session.getAttribute("logId");
		String productNo = req.getParameter("pno");
		
		ReviewVO review = new ReviewVO();
		review.setUserId(userId);
		review.setProductNo(Integer.parseInt(productNo));
		ReviewService reviewService = new ReviewServiceImpl();
		
		int userReviewCnt = reviewService.getUserReviewCnt(review);
		
		resp.getWriter().print("{\"userReviewCnt\":" + userReviewCnt + "}");
	}

}
