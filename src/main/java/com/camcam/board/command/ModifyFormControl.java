package com.camcam.board.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camcam.board.vo.QnAVO;
import com.camcam.common.Control;
import com.google.gson.Gson;

public class ModifyFormControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("userId");
		String bno = req.getParameter("bno");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		
		QnAVO vo = new QnAVO();
		vo.setUserId(id);
		vo.setBoardNo(Integer.parseInt(bno));
		vo.setTitle(title);
		vo.setContent(content);
		
		req.setAttribute("result", vo);
		
		String path = "board/editBoard.tiles";
		req.getRequestDispatcher(path).forward(req, resp);
	}

}
