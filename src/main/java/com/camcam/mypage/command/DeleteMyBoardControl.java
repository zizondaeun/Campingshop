package com.camcam.mypage.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camcam.common.Control;
import com.camcam.mypage.service.MyPageService;
import com.camcam.mypage.service.impl.MyPageServiceImpl;

public class DeleteMyBoardControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");
		
		String bno = req.getParameter("bno");
		String pw = req.getParameter("boardPw");
		
		MyPageService svc = new MyPageServiceImpl();
		//QnAVO vo = new QnAVO();
		//vo.setBoardNo(Integer.parseInt(bno));
		//vo.setBoardPw(pw);
			
		if(svc.removeMyboard(Integer.parseInt(bno),pw)) { //console에 
			resp.getWriter().write("{\"status\": \"success\", \"message\": \"게시글이 성공적으로 삭제되었습니다.\"}");
		}else {
			resp.getWriter().write("{\"status\": \"fail\", \"message\": \"게시글 삭제 실패.\"}");
		}
	}

}
