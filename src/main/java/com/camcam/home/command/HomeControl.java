package com.camcam.home.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camcam.common.Control;
import com.camcam.product.service.ProductService;
import com.camcam.product.service.impl.ProductServiceImpl;
import com.camcam.product.vo.ProductVO;

public class HomeControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = "home/home.tiles";
		
		ProductService productService = new ProductServiceImpl();
		
		List<ProductVO> pList = productService.recentProductList();
		for (ProductVO productVO : pList) {
			System.out.println("productVO = " + productVO.toString());
		}
		req.setAttribute("pList", pList);
		
		req.getRequestDispatcher(path).forward(req, resp);
	}
}
