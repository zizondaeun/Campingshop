package com.camcam.user.command;

import java.io.IOException;



import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camcam.common.Control;


public class SignInFormControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = "WEB-INF/member/signUp.jsp";
		path = "member/signUp.tiles";
		 req.getRequestDispatcher(path).forward(req, resp);
	}

}
