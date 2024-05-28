package com.camcam.mypage.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camcam.board.vo.QnAVO;
import com.camcam.common.Control;
import com.camcam.mypage.service.MyPageService;
import com.camcam.mypage.service.impl.MyPageServiceImpl;

public class MyBoardModFormControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = "mypage/myboardedit.tiles";
		String bno = req.getParameter("bno");
		String pw = req.getParameter("boardPw");

		MyPageService svc = new MyPageServiceImpl();
		QnAVO vo = svc.getBoardNo(Integer.parseInt(bno), pw);
		if (vo != null) {
			req.setAttribute("result", vo);
			req.getRequestDispatcher(path).forward(req, resp);
		} else {
			resp.sendRedirect("myBoardInfo.do?bno=" + bno);
		}
	}

}
