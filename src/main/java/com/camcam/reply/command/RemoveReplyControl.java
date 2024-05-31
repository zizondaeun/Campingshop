package com.camcam.reply.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camcam.common.Control;
import com.camcam.reply.service.ReplyService;
import com.camcam.reply.service.impl.ReplyServiceImpl;

public class RemoveReplyControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String rno = req.getParameter("rno");
		
		ReplyService svc = new ReplyServiceImpl();
		
		if(svc.removeReply(Integer.parseInt(rno))) {
			//{"retCode": "OK"}
			resp.getWriter().print("{\"retCode\": \"OK\"}");
		}else {
			resp.getWriter().print("{\"retCode\": \"NG\"}");		
		}
	}

}
