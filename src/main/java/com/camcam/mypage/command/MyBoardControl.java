package com.camcam.mypage.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camcam.common.Control;
import com.camcam.common.HttpUtils;
import com.camcam.mypage.service.MyPageService;
import com.camcam.mypage.service.impl.MyPageServiceImpl;
import com.camcam.user.vo.UserVO;

public class MyBoardControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = "myboard/myboard.tiles";

		String id = req.getParameter("userId");
		
		MyPageService svc = new MyPageServiceImpl();
		UserVO vo = svc.getMyboard(id);
		req.setAttribute("list", vo);
		
		HttpUtils.forward(req, resp, path);
		////
		
		
	}

}
