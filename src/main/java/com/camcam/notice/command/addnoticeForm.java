package com.camcam.notice.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.camcam.common.Control;
import com.camcam.user.service.UserService;
import com.camcam.user.service.impl.UserServiceImpl;
import com.camcam.user.vo.UserVO;

public class addnoticeForm implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = req.getSession();
			
		//session값을 가져와서 logId값을 조회함
		 String lod = (String) session.getAttribute("logId");
		 
		 UserService svc = new UserServiceImpl();

			
			UserVO vo = svc.loginFinds(lod);
			
			
	        req.setAttribute("user", vo);
		
		String path = "admin/addnotice.tiles";
		req.getRequestDispatcher(path).forward(req, resp);

	}

}
