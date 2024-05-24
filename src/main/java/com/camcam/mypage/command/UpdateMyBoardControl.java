package com.camcam.mypage.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camcam.common.Control;
import com.camcam.mypage.service.MyPageService;
import com.camcam.mypage.service.impl.MyPageServiceImpl;
import com.camcam.product.vo.QnAVO;

public class UpdateMyBoardControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// System.out.println("1004");
		req.setCharacterEncoding("utf-8");

		String bno = req.getParameter("bno");
		String pw = req.getParameter("boardPw");
		String id = req.getParameter("userId");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		// String date = req.getParameter("createDate");
		
		MyPageService svc = new MyPageServiceImpl();
		QnAVO vo = new QnAVO();
		
		vo.setBoardNo(Integer.parseInt(bno));
		vo.setBoardPw(pw);
		vo.setUserId(id);
		vo.setTitle(title);
		vo.setContent(content);
		// vo.setCreateDate(date);
		//req.setAttribute("result", vo);

		if (svc.modifyMyboard(vo)) {
			resp.sendRedirect("myBoardList.do?bno=" + bno);
		} else {
			resp.sendRedirect("myBoardMod.do?bno=" + bno);
		}

		
	}

}
