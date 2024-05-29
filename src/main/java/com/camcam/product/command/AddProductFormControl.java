package com.camcam.product.command;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camcam.common.Control;
import com.camcam.common.HttpUtils;
import com.camcam.product.service.ProductService;
import com.camcam.product.service.impl.ProductServiceImpl;

public class AddProductFormControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String path = "admin/addProduct.tiles";
		// req.getRequestDispatcher(path).forward(req, resp);
		ProductService svc = new ProductServiceImpl();
		List<Map<String, String>> list = svc.categoryList();
		req.setAttribute("categoryList", list);

		HttpUtils.forward(req, resp, path);
	}

}
