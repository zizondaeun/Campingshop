package com.camcam.board.command;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camcam.board.service.BoardService;
import com.camcam.board.service.impl.BoardServiceImpl;
import com.camcam.board.vo.QnAVO;
import com.camcam.common.Control;

public class ModifyControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String bno = req.getParameter("bno");
		String id = req.getParameter("userId");
		String title = req.getParameter("title");
		String content1 = req.getParameter("content");
//		String page = req.getParameter("page");
//		String sc = req.getParameter("searchCondition");
//		String kw = req.getParameter("keyword");
		//System.out.println(bno + id + "1004" + title + content);
		
		BoardService svc = new BoardServiceImpl();
		QnAVO vo = new QnAVO();
		vo.setBoardNo(Integer.parseInt(bno));
		vo.setUserId(id);
		vo.setTitle(title);
		vo.setContent(content1);
		
		req.setAttribute("result", vo);
		//String encodeKW = URLEncoder.encode(kw, "UTF-8");
		if(svc.modifyBoard(vo)) {
			resp.sendRedirect("boardList.do");
		}else {
			resp.sendRedirect("modBoardForm.do");
		}
	}

}
