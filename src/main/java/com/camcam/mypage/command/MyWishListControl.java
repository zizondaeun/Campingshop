package com.camcam.mypage.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.camcam.common.Control;
import com.camcam.common.PageDTO;
import com.camcam.mypage.service.MyPageService;
import com.camcam.mypage.service.impl.MyPageServiceImpl;
import com.camcam.mypage.vo.PageVO;
import com.camcam.product.vo.ProductVO;

public class MyWishListControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String path = "mypage/mywishList.tiles";
		String id = (String) session.getAttribute("logId");
		String page = req.getParameter("page");
		if(id == null) {
			id = " ";
		}
		
		MyPageService svc = new MyPageServiceImpl();
		page = page == null ? "1" : page;
		PageVO vo = new PageVO();
		vo.setUserId(id);
		vo.setPage(Integer.parseInt(page));
		
		List<ProductVO> list= svc.getMywish(vo);
		
		PageDTO pageDTO = new PageDTO(Integer.parseInt(page), svc.getWishTotal(vo)); 
		req.setAttribute("list", list);
		req.setAttribute("paging", pageDTO);
		
		int totalCnt = svc.getWishTotal(vo); // 총 관심상품 개수
	    pageDTO = new PageDTO(Integer.parseInt(page), totalCnt);

	    // 로그 출력
	    System.out.println("현재 페이지: " + page);
	    System.out.println("총 관심상품 개수: " + totalCnt);
	    System.out.println("페이징 정보: " + pageDTO);
		
		req.getRequestDispatcher(path).forward(req, resp);
		//HttpUtils.forward(req, resp, path);
	}

}
