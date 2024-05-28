package com.camcam.board.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camcam.board.service.BoardService;
import com.camcam.board.service.impl.BoardServiceImpl;
import com.camcam.board.vo.QnAVO;
import com.camcam.common.Control;

public class BoardInfoControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = "board/board.tiles";
		String bno = req.getParameter("bno");
		System.out.println(bno + "1004");
		BoardService svc = new BoardServiceImpl();
		QnAVO vo = svc.getBoard(Integer.parseInt(bno));
		req.setAttribute("result", vo);
		
		req.getRequestDispatcher(path).forward(req, resp);
	}

}
