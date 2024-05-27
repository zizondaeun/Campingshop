package com.camcam.product.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camcam.common.Control;
import com.camcam.product.service.ProductService;
import com.camcam.product.service.impl.ProductServiceImpl;
import com.camcam.product.vo.ProductVO;
import com.camcam.review.service.ReviewService;
import com.camcam.review.service.impl.ReviewServiceImpl;
import com.camcam.review.vo.ReviewVO;

public class ProductInfoControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = "product/productInfo.tiles";
		String pNo = req.getParameter("pno");
		String userId = req.getParameter("uid");
		String keyword = req.getParameter("keyword");
		
		userId = userId ==null ? " " : userId;
		
		
		ProductService productService = new ProductServiceImpl();
		ReviewService reviewService = new ReviewServiceImpl();
		ProductVO productInfo = productService.productInfo(Integer.parseInt(pNo));
		productInfo.setUserId(userId);
		
		ReviewVO reviewDetail = reviewService.totalCount(Integer.parseInt(pNo));
		
		
		
		int truncRate;
		if(reviewDetail.getTotalCnt() != 0) {
			truncRate = reviewDetail.getSumRate() / reviewDetail.getTotalCnt();
		} else {
			truncRate = 0;
		}
		
		reviewDetail.setTruncRating(truncRate);
		
		req.setAttribute("product", productInfo);
		req.setAttribute("keyword", keyword);
		req.setAttribute("reviewDetail", reviewDetail);
		
		req.getRequestDispatcher(path).forward(req, resp);
		
	}

}
