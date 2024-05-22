package com.camcam.user.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camcam.common.Control;
import com.camcam.common.HttpUtils;
import com.camcam.user.service.MyPageService;
import com.camcam.user.service.impl.MyPageServiceImpl;
import com.camcam.user.vo.UserVO;

public class MyPageControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("userId");
		
		MyPageService svc = new MyPageServiceImpl();
		UserVO vo = svc.getMypage(id);
		System.out.println(id);
		
		req.setAttribute("result", vo);
		
		String path = "WEB-INF/view/mypage/mypage.jsp";
		path = "mypage/mypage.tiles";
		
		HttpUtils.forward(req, resp, path);
	}

}
