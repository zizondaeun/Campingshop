package com.camcam.board.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camcam.board.service.BoardService;
import com.camcam.board.service.impl.BoardServiceImpl;
import com.camcam.common.Control;

public class DeleteControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String bno = req.getParameter("bno");
		//System.out.println("~~~~~~~~~~~" + bno);
		
		BoardService svc = new BoardServiceImpl();
		
		if(svc.removeBoard(Integer.parseInt(bno))) {
			resp.sendRedirect("boardList.do");
		}else {
			resp.sendRedirect("boardInfo.do");
		}
	}

}
