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

public class ProductInfoControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = "product/productInfo.tiles";
		String pNo = req.getParameter("pno");
		String keyword = req.getParameter("keyword");
		
		
		ProductService productService = new ProductServiceImpl();
		ReviewService reviewService = new ReviewServiceImpl();
		ProductVO productInfo = productService.productInfo(Integer.parseInt(pNo));
		int reviewCnt = reviewService.totalCount(Integer.parseInt(pNo));
		
		req.setAttribute("product", productInfo);
		req.setAttribute("keyword", keyword);
		req.setAttribute("reviewCnt", reviewCnt);
		
		req.getRequestDispatcher(path).forward(req, resp);
		
	}

}
