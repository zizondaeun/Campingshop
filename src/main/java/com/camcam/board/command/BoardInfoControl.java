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
		String id = req.getParameter("userId");
		String pw = req.getParameter("boardPw"); 
		
		//String page = req.getParameter("page");
		//String sc = req.getParameter("searchCondition");
		//String kw = req.getParameter("keyword");
		
		BoardService svc = new BoardServiceImpl();
		QnAVO vo = new QnAVO();
		vo.setBoardNo(Integer.parseInt(bno));
		vo.setUserId(id);
		vo.setBoardPw(pw);
		
		QnAVO qvo = svc.getBoardPw(vo);
		System.out.println(qvo);
		if(qvo != null) { 
			req.setAttribute("result", qvo);
			req.getRequestDispatcher(path).forward(req, resp);
		} else {
			resp.sendRedirect("boardInfoPw.do?bno=" + bno + "&userId=" + id);
		}
		
		//req.setAttribute("page", page);
		//req.setAttribute("searchCondition", sc);
		//req.setAttribute("keyword", kw);
		
	}

}
