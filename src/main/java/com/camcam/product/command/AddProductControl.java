package com.camcam.product.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camcam.common.Control;
import com.camcam.product.service.ProductService;
import com.camcam.product.service.impl.ProductServiceImpl;
import com.camcam.product.vo.ProductVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class AddProductControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// category, productTitle, productPrice 파리미터.
		// multipart요청처리를 위한 처리. 1.request정보. 2.저장경로 3.max사이즈 4.인코딩 5.리네임정책.
		String savePath = req.getServletContext().getRealPath("productImg");
		int maxSize = 5 * 1024 * 1024;

		MultipartRequest mr = new MultipartRequest(req, savePath, maxSize, "utf-8"//
				, new DefaultFileRenamePolicy());

		String category = mr.getParameter("category");
		String productTitle = mr.getParameter("productTitle");
		String productPrice = mr.getParameter("productPrice");
		String offPrice = mr.getParameter("offPrice");
		String img = mr.getFilesystemName("productImg");
		String img2 = mr.getFilesystemName("productImg2");
		String img3 = mr.getFilesystemName("productImg3");
		String explainImg1 = mr.getFilesystemName("explainImg1");
		String explainImg2 = mr.getFilesystemName("explainImg2");
		
		ProductService svc = new ProductServiceImpl();

		ProductVO vo = new ProductVO();
		vo.setCategoryCode(category);
		vo.setProductName(productTitle);
		vo.setPrice(productPrice);
		vo.setOffPrice(offPrice);
		vo.setProductImg(img);
		vo.setProductImg2(img2);
		vo.setProductImg3(img3);
		vo.setExplainImg1(explainImg1);
		vo.setExplainImg2(explainImg2);
		
		if (svc.addProduct(vo)) {
			System.out.println("등록성공.");
			// 페이지이동 :목록페이지.
			resp.sendRedirect("productList.do");

		} else {
			System.out.println("등록실패.");
			resp.sendRedirect("addProductForm.do");

		}

	}

}
