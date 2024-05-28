package com.camcam.user.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.camcam.common.Control;
import com.camcam.user.service.UserService;
import com.camcam.user.service.impl.UserServiceImpl;
import com.camcam.user.vo.UserVO;

public class MyinformationFormControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

		req.setCharacterEncoding("utf-8");

				
		//session있는 logId값을 가져와서 logId값을 조회하고 출력한다 
		//조회를 한결과를 myinformaion.jsp에 가져간다
		//loginform 저장한다
		
		//session울가져옴
		HttpSession session = req.getSession();
		
		//session값을 가져와서 logId값을 조회함
		 String lod = (String) session.getAttribute("logId");
		
				
	     
		//서비스객체를 생성
		UserService svc = new UserServiceImpl();

				
		UserVO vo = svc.loginFinds(lod);
		
		
        req.setAttribute("user", vo);

        
		String 	path = "mypage/myinformation.tiles";

		
		req.getRequestDispatcher(path).forward(req, resp);

	}

}
