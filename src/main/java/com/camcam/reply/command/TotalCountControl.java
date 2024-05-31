package com.camcam.reply.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camcam.common.Control;
import com.camcam.reply.service.ReplyService;
import com.camcam.reply.service.impl.ReplyServiceImpl;

public class TotalCountControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String bno = req.getParameter("bno");
		//service, mapper
		ReplyService svc = new ReplyServiceImpl();
		int cnt = svc.getReplyCnt(Integer.parseInt(bno));
		
		//{totalCount: 10}
		resp.getWriter().print("{\"totalCount\": " + cnt + "}");
	}

}
