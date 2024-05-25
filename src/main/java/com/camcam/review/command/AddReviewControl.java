package com.camcam.review.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camcam.common.Control;
import com.camcam.review.service.ReviewService;
import com.camcam.review.service.impl.ReviewServiceImpl;
import com.camcam.review.vo.ReviewVO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class AddReviewControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json; charset=UTF-8");
		// 제품번호, 리뷰작성자, 리뷰내용, 평점
		String pno = req.getParameter("pno");
		String user = req.getParameter("user");
		String content = req.getParameter("content");
		String rating = req.getParameter("rating");
		
		req.setAttribute("user", user);
		
		ReviewVO rvo = new ReviewVO();
		rvo.setProductNo(Integer.parseInt(pno));
		rvo.setUserId(user);
		rvo.setContent(content);
		rvo.setRating(Integer.parseInt(rating));
		
		Map<String, Object> result = new HashMap<>();
		
		ReviewService svc = new ReviewServiceImpl();
		
		if(svc.addReview(rvo)) {
			result.put("retCode", "OK");
			result.put("retVal", rvo);
		} else {
			result.put("retCode", "NG");
			result.put("retVal", null);
		}
		
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(result);
		
		resp.getWriter().print(json);
	}

}
