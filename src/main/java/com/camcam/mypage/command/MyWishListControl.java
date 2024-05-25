package com.camcam.mypage.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camcam.common.Control;

public class MyInterestListControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = "mypage/myinterestList.tiles";
		
		req.getRequestDispatcher(path).forward(req, resp);
		
		
	}

}
