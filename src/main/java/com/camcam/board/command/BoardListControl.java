package com.camcam.board.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camcam.board.service.BoardService;
import com.camcam.board.service.impl.BoardServiceImpl;
import com.camcam.board.vo.QnAVO;
import com.camcam.common.Control;

public class BoardListControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = "board/boardList.tiles";
		
		BoardService svc = new BoardServiceImpl();
		List<QnAVO> list = svc.boardList();
		System.out.println(list + "1004");
		
		req.setAttribute("boardList", list);
		
		req.getRequestDispatcher(path).forward(req, resp);
	}

}
