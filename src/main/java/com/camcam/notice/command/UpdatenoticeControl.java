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

public class UpdatenoticeControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
	

	
		
		String noticeNo = req.getParameter("noticeNo");
		String noticeSubject = req.getParameter("noticeSubject");
		String noticeContent = req.getParameter("noticeContent");
		
		System.out.println("*&&"+noticeNo + noticeSubject + noticeContent +" @@@@@@@@@@@@@@@@@@@@");
		
		NoticeService svc = new NoticeServiceImpl();

		NoticeVO vo = new NoticeVO();
		
		vo.setNoticeNo(Integer.parseInt(noticeNo));
		vo.setNoticeSubject(noticeSubject);
		vo.setNoticeContent(noticeContent);
		
		req.setAttribute("result", vo);
		//String encodeKW = URLEncoder.encode(kw, "UTF-8");
		if(svc.modifyNotice(vo)) {
			resp.sendRedirect("ListnoticePage.do");
		}else {
			
		}
	}

}