package com.camcam.notice.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camcam.board.service.BoardService;
import com.camcam.board.service.impl.BoardServiceImpl;
import com.camcam.board.vo.QnAVO;
import com.camcam.common.Control;

public class UpdatenoticeControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String bno = req.getParameter("bno");
		String id = req.getParameter("userId");
		String noticeSubject = req.getParameter("noticeSubject");
		String noticecontent = req.getParameter("content").replaceAll("<[^>]*>", "");

		
		BoardService svc = new BoardServiceImpl();
		QnAVO vo = new QnAVO();
		vo.setBoardNo(Integer.parseInt(bno));
		vo.setUserId(id);
		vo.setTitle(noticeSubject);
		vo.setContent(noticecontent);
		
		req.setAttribute("result", vo);
		//String encodeKW = URLEncoder.encode(kw, "UTF-8");
		if(svc.modifyBoard(vo)) {
			resp.sendRedirect("boardList.do");
		}else {
			resp.sendRedirect("modBoardForm.do");
		}	
	}

}
