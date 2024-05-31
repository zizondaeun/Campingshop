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

public class AddReplyControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("type/json;charset=utf-8");

		// 원본 글, 댓글 작성자, 댓글 내용
		String bno = req.getParameter("bno");
		String reply = req.getParameter("reply");

		ReplyVO rvo = new ReplyVO();
		rvo.setBoardNo(Integer.parseInt(bno));
		rvo.setReply(reply);

		Map<String, Object> result = new HashMap<>();

		ReplyService svc = new ReplyServiceImpl();
		if (svc.addReply(rvo)) {
			result.put("retCode", "OK");
			result.put("retVal", rvo); // 성공했을때 ReplyVO를 넣어

			// resp.getWriter().print("{\"retCode\": \"OK\"}");
		} else {
			result.put("retCode", "NG");
			result.put("retVal", null);

			// resp.getWriter().print("{\"retCode\": \"NG\"}");
		}
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(result);

		resp.getWriter().print(json);
	}

}
