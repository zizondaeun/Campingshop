package com.camcam.notice.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camcam.common.Control;
import com.camcam.notice.service.NoticeService;
import com.camcam.notice.service.impl.NoticeServiceImpl;

public class deletenoticeControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String bno = req.getParameter("bno");
		//System.out.println("~~~~~~~~~~~" + bno);
		System.out.println(bno +"****************************************");
		
		NoticeService svc = new NoticeServiceImpl();
		
		if(svc.removeNotice(Integer.parseInt(bno))) {
			resp.sendRedirect("ListnoticePage.do");
		}else {
			resp.sendRedirect("noticePage.do");
		}
	}

}
