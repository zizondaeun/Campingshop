package com.camcam.notice.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.camcam.board.service.BoardService;
import com.camcam.board.service.impl.BoardServiceImpl;
import com.camcam.board.vo.QnAVO;
import com.camcam.common.Control;
import com.camcam.notice.service.NoticeService;
import com.camcam.notice.service.impl.NoticeServiceImpl;
import com.camcam.notice.vo.NoticeVO;

public class AddnoticeControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		String userId = req.getParameter("userId");
		String noticeSubject = req.getParameter("noticeSubject");
		String noticeContent = req.getParameter("noticeContent");
		
		System.out.println(userId + noticeSubject + noticeContent + "************************************");
		
//		if(title == "" || content1 == "" || pw == "") {
//			req.setAttribute("error", "값을 입력해주세요.");
//			req.getRequestDispatcher("board/addBoard.tiles").forward(req, resp);
//			return;
//		}
		
		NoticeService svc = new NoticeServiceImpl();

		NoticeVO vo = new NoticeVO();
		vo.setUserId(userId);
		vo.setNoticeSubject(noticeSubject);
		vo.setNoticeContent(noticeContent);
		
		req.setAttribute("result", vo);
		if(svc.addNotice(vo)) {
			resp.sendRedirect("ListnoticePage.do");
		}else {
			resp.sendRedirect("error.do");
				}
		}
	}


