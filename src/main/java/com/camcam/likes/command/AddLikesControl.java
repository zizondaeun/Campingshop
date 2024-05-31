package com.camcam.likes.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.camcam.common.Control;

public class AddLikesControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		// 넘어와야할 파라미터 : pno
		HttpSession session = req.getSession();
		String userId = (String) session.getAttribute("logId");
		String pno = req.getParameter("pno");
		String likeStatus = req.getParameter("status");
		
		
		
		
	}

}
