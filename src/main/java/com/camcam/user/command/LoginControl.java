package com.camcam.user.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.camcam.common.Control;
import com.camcam.user.service.UserService;
import com.camcam.user.service.impl.UserServiceImpl;
import com.camcam.user.vo.UserVO;

public class LoginControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		
		 System.out.println(id + "****************************");
		
		UserService svc = new UserServiceImpl();
		
		UserVO uvo = svc.login(id, pw);
		
		if(uvo != null) {
			HttpSession session = req.getSession();
			session.setAttribute("logId", uvo.getUserId());
			resp.sendRedirect("home.do");
			
		}else {
		
		resp.sendRedirect("logForm.do");
		}
	}

}
