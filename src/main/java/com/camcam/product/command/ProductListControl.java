package com.camcam.product.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camcam.common.Control;
import com.camcam.common.PageDTO;
import com.camcam.common.SearchVO;
import com.camcam.product.service.ProductService;
import com.camcam.product.service.impl.ProductServiceImpl;
import com.camcam.product.vo.ProductVO;

public class ProductListControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = "product/productList.tiles";
		
		String page = req.getParameter("page");
		String category = req.getParameter("category");
		String kw = req.getParameter("keyword");
		
//		System.out.println("아ㅏ아아ㅏ아아" + category);

		page = page ==null ? "1" : page; // 페이지 파라미터가 없을때 page = 1
		
		if(kw == null) {
			if(category != null) {
				kw = category;
			} else {
				kw = "";
			}
		}
		
//		System.out.println("아아ㅏ아아아아ㅏ아아ㅏ아아ㅏㅇ" + kw);
		
		SearchVO search = new SearchVO();
		
		search.setPage(Integer.parseInt(page));
		search.setKeyword(kw);
		ProductService productService = new ProductServiceImpl();
		
		int total = productService.getTotal(search);
		System.out.println(total);
		
		PageDTO pageDTO = new PageDTO(Integer.parseInt(page), total);

		List<ProductVO> pList = productService.productList(search);
		for (ProductVO productVO : pList) {
			System.out.println("productVO = " + productVO.toString());
		}
		
		req.setAttribute("paging", pageDTO);
		req.setAttribute("pList", pList);
		req.setAttribute("keyword", kw);
		
		req.getRequestDispatcher(path).forward(req, resp);
		
		
		
	}

}
