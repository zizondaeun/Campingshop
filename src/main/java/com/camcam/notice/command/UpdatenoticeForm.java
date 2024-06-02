package com.camcam.notice.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camcam.board.vo.QnAVO;
import com.camcam.common.Control;
import com.camcam.notice.vo.NoticeVO;

public class UpdatenoticeForm implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userId = req.getParameter("userId");
		String noticeNo = req.getParameter("noticeNo");
		String noticeSubject = req.getParameter("noticeSubject");
		String noticeContent = req.getParameter("noticeContent");
		
		System.out.println(noticeNo + "********************************");
		
		NoticeVO vo = new NoticeVO();
		vo.setUserId(userId);
		try {
			if (noticeNo != null && !noticeNo.isEmpty()) {
				vo.setNoticeNo(Integer.parseInt(noticeNo));
			}
		} catch (NumberFormatException e) {
			// noticeNo가 정수로 변환할 수 없는 경우 처리
			// 예: null 값이거나 숫자가 아닌 문자열인 경우
			e.printStackTrace();
		}
		vo.setNoticeSubject(noticeSubject);
		vo.setNoticeContent(noticeContent);
		
		req.setAttribute("result", vo);
		
		String path = "admin/updatenotice.tiles";
		req.getRequestDispatcher(path).forward(req, resp);
	}

}
