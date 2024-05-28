package com.camcam.mypage.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.camcam.board.vo.QnAVO;
import com.camcam.common.Control;
import com.camcam.common.PageDTO;
import com.camcam.mypage.service.MyPageService;
import com.camcam.mypage.service.impl.MyPageServiceImpl;
import com.camcam.mypage.vo.PageVO;

public class MyBoardListControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String path = "mypage/myboardList.tiles";
		String id = (String) session.getAttribute("logId");
		String page = req.getParameter("page");
		if(id.equals("")) {
			id = (String) session.getAttribute("logId");
		}
		
		MyPageService svc = new MyPageServiceImpl();
		//현재 페이지
		page = page == null ? "1" : page; //page가 null이면 1페이지로, 아니면 page로
		//총 데이터 개수 구하기
		PageVO vo = new PageVO();
		vo.setUserId(id);
		vo.setPage(Integer.parseInt(page));
		
		List<QnAVO> list = svc.getMyboard(vo);
		//전체 페이지
		PageDTO pageDTO = new PageDTO(Integer.parseInt(page), svc.getBoardTotal(vo)); 
		req.setAttribute("list", list);
		req.setAttribute("paging", pageDTO);
		
		req.getRequestDispatcher(path).forward(req, resp);
		
	}

}
