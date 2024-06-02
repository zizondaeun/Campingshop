package com.camcam.board.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.camcam.board.service.BoardService;
import com.camcam.board.service.impl.BoardServiceImpl;
import com.camcam.board.vo.QnAVO;
import com.camcam.common.Control;

public class AddBoardControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("logId");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String content1 = content.replaceAll("<[^>]*>", "");
		String pw = req.getParameter("boardPw");
		
		if(title == "" || content1 == "" || pw == "") {
			req.setAttribute("error", "내용을 입력해주세요.");
			req.getRequestDispatcher("board/addBoard.tiles").forward(req, resp);
			return;
		}
		
		BoardService svc = new BoardServiceImpl();
		QnAVO vo = new QnAVO();
		vo.setUserId(id);
		vo.setTitle(title);
		vo.setContent(content1);
		vo.setBoardPw(pw);
		
		req.setAttribute("result", vo);
		if(svc.addBoard(vo)) {
			resp.sendRedirect("boardList.do");
		}else {
			resp.sendRedirect("error.do");
		}
		
	}

}
