package com.camcam.review.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camcam.common.Control;
import com.camcam.review.service.ReviewService;
import com.camcam.review.service.impl.ReviewServiceImpl;
import com.camcam.review.vo.ReviewVO;

public class ReviewCountControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pno = req.getParameter("pno");
		
		ReviewService svc = new ReviewServiceImpl();
		
		ReviewVO cnt = svc.totalCount(Integer.parseInt(pno));
		
		resp.getWriter().print("{\"totalCount\":" + cnt.getTotalCnt() + "}");
	}

}
