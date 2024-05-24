package com.camcam.mypage.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camcam.common.Control;
import com.camcam.mypage.service.MyPageService;
import com.camcam.mypage.service.impl.MyPageServiceImpl;
import com.camcam.product.vo.QnAVO;

public class DeleteMyboardControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");
		
		String bno = req.getParameter("bno");
		String pw = req.getParameter("boardPw");
		//System.out.println(bno + "119" + pw);
		MyPageService svc = new MyPageServiceImpl();
		//QnAVO vo = new QnAVO();
		//vo.setBoardNo(Integer.parseInt(bno));
		//vo.setBoardPw(pw);
		
		if(svc.removeMyboard(Integer.parseInt(bno),pw)) {
			resp.sendRedirect("myBoardList.do");
		}else {
			resp.sendRedirect("error.do");
		}
	}

}
