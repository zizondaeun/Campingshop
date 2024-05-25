package com.camcam.review.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camcam.common.Control;
import com.camcam.common.SearchVO;
import com.camcam.review.service.ReviewService;
import com.camcam.review.service.impl.ReviewServiceImpl;
import com.camcam.review.vo.ReviewVO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class ReviewListControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=UTF-8");
		String pno = req.getParameter("pno");
		String page = req.getParameter("page");
		page = page == null ? "1": page;
		
		SearchVO svo = new SearchVO();
		svo.setBoardNo(Integer.parseInt(pno));
		svo.setRpage(Integer.parseInt(page));
		
		ReviewService svc = new ReviewServiceImpl();
		List<ReviewVO> list = svc.reviewList(svo);
		
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(list);
		resp.getWriter().print(json);
	}

}
