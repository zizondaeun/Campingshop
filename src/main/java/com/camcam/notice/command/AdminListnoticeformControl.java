package com.camcam.notice.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camcam.common.Control;
import com.camcam.notice.service.NoticeService;
import com.camcam.notice.service.impl.NoticeServiceImpl;
import com.camcam.notice.vo.NoticeVO;

public class AdminListnoticeformControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 String path = "notice/Pagenotice.tiles"; // 상세 페이지의 경로
	        
	        String bno = req.getParameter("bno");
	        String id = req.getParameter("userId");
	        
	        NoticeService svc = new NoticeServiceImpl();
	        NoticeVO vo = svc.getNotice(Integer.parseInt(bno)); // NoticeVO를 가져오는 메서드가 필요합니다.
	        vo.setUserId(id); // 가져온 NoticeVO에 사용자 ID를 설정합니다.
	        
	        if(vo != null) {
	            req.setAttribute("result", vo);
	            req.getRequestDispatcher(path).forward(req, resp);
	        }
	}

}
