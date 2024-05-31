package com.camcam.reply.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camcam.common.Control;
import com.camcam.common.SearchVO;
import com.camcam.reply.service.ReplyService;
import com.camcam.reply.service.impl.ReplyServiceImpl;
import com.camcam.reply.vo.ReplyVO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class ReplyListControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");
		
		String bno = req.getParameter("bno");
		System.out.println(bno + "1004"); //js해주니까 bno나와
		String page = req.getParameter("page");
		page = page == null ? "1" : page;
		 
		SearchVO search = new SearchVO();
		search.setBoardNo(Integer.parseInt(bno));
		search.setRpage(Integer.parseInt(page));
		
		ReplyService svc = new ReplyServiceImpl();
		List<ReplyVO> list = svc.replyList(search);

		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(list);

		resp.getWriter().print(json);
	}

}
