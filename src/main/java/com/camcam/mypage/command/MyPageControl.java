package com.camcam.mypage.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camcam.common.Control;
import com.camcam.common.PageDTO;
import com.camcam.delivery.vo.DeliveryVO;
import com.camcam.mypage.service.MyPageService;
import com.camcam.mypage.service.impl.MyPageServiceImpl;
import com.camcam.mypage.vo.PageVO;

public class MyPageControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = "mypage/mypage.tiles";
		String id = req.getParameter("userId");
		String page = req.getParameter("page");
		
		MyPageService svc = new MyPageServiceImpl();
		//UserVO vo = svc.getMypage(id);
		page = page == null ? "1" : page;
		PageVO vo = new PageVO();
		vo.setUserId(id);
		vo.setPage(Integer.parseInt(page));
		
		List<DeliveryVO> list = svc.getMydelivery(vo);
		//req.setAttribute("result", vo);
		PageDTO pageDTO = new PageDTO(Integer.parseInt(page), svc.getDeliTotal(vo)); 
		req.setAttribute("list", list);
		req.setAttribute("paging", pageDTO);
		
		req.getRequestDispatcher(path).forward(req, resp);
		//HttpUtils.forward(req, resp, path);
		
	}

}
