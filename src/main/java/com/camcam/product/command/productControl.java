package com.camcam.product.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camcam.common.Control;
import com.camcam.product.service.ProductService;
import com.camcam.product.service.impl.ProductServiceImpl;
import com.camcam.product.vo.ProductVO;

public class productControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String path = "admin/productControl.tiles";

		ProductService svc = new ProductServiceImpl();

		List<ProductVO> list = svc.productList();

		System.out.println("물품리스트: " + list);

		req.setAttribute("productList", list);

		req.getRequestDispatcher(path).forward(req, resp);

	}
}
