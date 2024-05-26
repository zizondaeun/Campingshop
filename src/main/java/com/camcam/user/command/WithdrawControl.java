package com.camcam.user.command;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camcam.common.Control;
import com.camcam.user.service.UserService;
import com.camcam.user.service.impl.UserServiceImpl;

public class WithdrawControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userId = req.getParameter("userId");
		
		System.out.println(userId + "*************************************************");

		UserService svc = new UserServiceImpl();
		if (svc.modifyUser(userId)) { // 수정...
			resp.sendRedirect("main.do");
			
		} else {
			System.out.println("처리중 에러.");

		}
	}

}
