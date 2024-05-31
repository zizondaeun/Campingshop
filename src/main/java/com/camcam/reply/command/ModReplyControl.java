package com.camcam.reply.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camcam.common.Control;
import com.camcam.reply.service.ReplyService;
import com.camcam.reply.service.impl.ReplyServiceImpl;
import com.camcam.reply.vo.ReplyVO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class ModReplyControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String rno = req.getParameter("rno");
		String reply = req.getParameter("reply");
		
		ReplyVO rvo = new ReplyVO();
		rvo.setReplyNo(Integer.parseInt(rno));
		rvo.setReply(reply);
		System.out.println(rvo);

		Map<String, Object> result = new HashMap<>();

		ReplyService svc = new ReplyServiceImpl();

		if (svc.modReply(rvo)) {
			result.put("retCode", "OK");
			// result.put("retVal", rvo);
		} else {
			result.put("retCode", "NG");
			// result.put("retVal", null);
		}
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(result);

		resp.getWriter().print(json);
	}

}
