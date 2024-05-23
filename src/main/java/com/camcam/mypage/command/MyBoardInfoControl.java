package com.camcam.mypage.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camcam.common.Control;
import com.camcam.mypage.service.MyPageService;
import com.camcam.mypage.service.impl.MyPageServiceImpl;
import com.camcam.product.vo.QnAVO;

public class MyBoardInfoControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String bno = req.getParameter("bno");
		
		MyPageService svc = new MyPageServiceImpl();
		QnAVO vo = svc.getBoardNo(Integer.parseInt(bno));
		
		req.setAttribute("result", vo);
		
		String path = "mypage/myboardInfo.tiles";
		
		req.getRequestDispatcher(path).forward(req, resp);
		//HttpUtils.forward(req, resp, path);
		
		
	}

}
