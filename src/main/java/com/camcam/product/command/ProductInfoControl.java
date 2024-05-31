package com.camcam.product.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camcam.cart.service.CartService;
import com.camcam.cart.service.impl.CartServiceImpl;
import com.camcam.cart.vo.CartVO;
import com.camcam.common.Control;
import com.camcam.likes.service.LikesService;
import com.camcam.likes.service.impl.LikeServiceImpl;
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

		userId = userId == null ? " " : userId;

		ProductService productService = new ProductServiceImpl();
		ReviewService reviewService = new ReviewServiceImpl();
		CartService cartService = new CartServiceImpl();
		ProductVO productInfo = productService.productInfo(Integer.parseInt(pNo));
		productInfo.setUserId(userId);
		ReviewVO review = new ReviewVO();
		review.setUserId(userId);
		review.setProductNo(Integer.parseInt(pNo));
		int userReviewCnt = reviewService.getUserReviewCnt(review);

		ReviewVO reviewDetail = reviewService.totalCount(Integer.parseInt(pNo));

		CartVO cart = new CartVO();
		cart.setUserId(userId);
		System.out.println("1111111111111111" + cart.getUserId());
		cart.setProductNo(Integer.parseInt(pNo));

		int userToProductCnt = cartService.getUserToProductCnt(cart);
		System.out.println("ddddddddddddddddfdfsdfdfd" + userToProductCnt);
		System.out.println("확인" + productInfo);
		System.out.println(productInfo.getProductImg());
		System.out.println("설명" + productInfo.getExplainImg1());

		int truncRate;
		if (reviewDetail.getTotalCnt() != 0) {
			truncRate = reviewDetail.getSumRate() / reviewDetail.getTotalCnt();
		} else {
			truncRate = 0;
		}

		reviewDetail.setTruncRating(truncRate);
		ProductVO product = new ProductVO();
		product.setUserId(userId);
		product.setProductNo(Integer.parseInt(pNo));
		LikesService likeService = new LikeServiceImpl();
		int userLikeCnt = likeService.getUserLikeCnt(product);

		req.setAttribute("product", productInfo);
		req.setAttribute("keyword", keyword);
		req.setAttribute("reviewDetail", reviewDetail);
		req.setAttribute("userReviewCnt", userReviewCnt);
		req.setAttribute("userToProductCnt", userToProductCnt);
		req.setAttribute("userLikeCnt", userLikeCnt);

		req.getRequestDispatcher(path).forward(req, resp);

	}

}
