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

public class PwFindControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = req.getParameter("id");
		String name = req.getParameter("name");
        String tel = req.getParameter("tel");

        System.out.println(id + "****************************");
        System.out.println(name + "****************************");
        System.out.println(tel + "****************************");

        UserService svc = new UserServiceImpl();

        UserVO uvo = svc.loginFind(name, tel);

        if (uvo != null) {
            HttpSession session = req.getSession();
            session.setAttribute("name", uvo.getUserId());
            resp.sendRedirect("pwFindForm.do");
            
        } else {
            resp.sendRedirect("pwFindForm.do");
        }
	}
}


