package com.camcam.user.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camcam.common.Control;
import com.camcam.user.service.UserService;
import com.camcam.user.service.impl.UserServiceImpl;
import com.camcam.user.vo.UserVO;

public class UserListControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String path = "WEB-INF/admin/userList.jsp";
		path = "admin/userList.tiles";
		UserService svc = new UserServiceImpl();
		List<UserVO> list = svc.userList();
		System.out.println("유저리스트확인" + list);
		/*
		 * UserServiceImpl uService = new UserServiceImpl(); List<UserVO> uList =
		 * uService.userList(); if(!uList.isEmpty()) { req.setAttribute("users", uList);
		 */
	
		req.setAttribute("userList", list);
		
		
		req.getRequestDispatcher(path).forward(req, resp);

		/*
		 * } else { req.setAttribute("msg", "fail"); }
		 */

	}

}
