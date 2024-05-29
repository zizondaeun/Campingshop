package com.camcam.board.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camcam.board.service.BoardService;
import com.camcam.board.service.impl.BoardServiceImpl;
import com.camcam.board.vo.QnAVO;
import com.camcam.common.Control;

public class BoardInfoPwControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = "board/boardPwCheck.tiles";
		String id = req.getParameter("userId");
		String bno = req.getParameter("bno");
		String pw = req.getParameter("boardPw"); //이거 맞아?
		
		BoardService svc = new BoardServiceImpl();
		QnAVO vo = new QnAVO();
		vo.setUserId(id);
		vo.setBoardNo(Integer.parseInt(bno));
		vo.setBoardPw(pw);

		req.setAttribute("result", vo);
		
		if(svc.getBoardPw(vo).getUserId().equals(id)) { //*원래는 폼태그 넣어서 이동해야한대..
//			resp.sendRedirect("boardInfoPw.do"); //두개 같이 못쓴대...
			req.getRequestDispatcher(path).forward(req, resp);
		}else {
			resp.sendRedirect("error.do");
		}
	}

}
