package com.camcam.mypage.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camcam.common.Control;
import com.camcam.mypage.service.MyPageService;
import com.camcam.mypage.service.impl.MyPageServiceImpl;

public class MyBoardDelControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String bno = req.getParameter("bno");
		System.out.println(bno + "1004");
		MyPageService svc = new MyPageServiceImpl();
		
		if(svc.removeMyboard(Integer.parseInt(bno))) {
			resp.sendRedirect("myPage.do");
		}else {
			resp.sendRedirect("삭제 에러");
		}
	}

}
