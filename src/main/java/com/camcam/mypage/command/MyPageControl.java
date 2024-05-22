package com.camcam.mypage.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camcam.common.Control;
import com.camcam.common.HttpUtils;

public class MyPageControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		String id = req.getParameter("userId");
//		
//		MyPageService svc = new MyPageServiceImpl();
//		UserVO vo = svc.getMypage(id);
//		System.out.println(id);
//		
//		req.setAttribute("result", vo);
		
		
		String path = "mypage/mypage.tiles";
		
		//req.getRequestDispatcher(path).forward(req, resp);
		HttpUtils.forward(req, resp, path);
		
	}

}
