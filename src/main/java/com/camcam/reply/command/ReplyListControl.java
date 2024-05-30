package com.camcam.reply.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camcam.common.Control;

public class ReplyListControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");
		
		String bno = req.getParameter("bno");
		System.out.println(bno + "@@@@@@@@@@@");
//		String page = req.getParameter("page");
//		page = page == null ? "1" : page;
//		
//		SearchVO search = new SearchVO();
//		search.setBoardNo(Integer.parseInt(bno));
//		search.setRpage(Integer.parseInt(page));
//		
//		//json형태의 데이터 반환
//		ReplyService svc = new ReplyServiceImpl();
//		List<ReplyVO> list = svc.replyList(search);
//
//		Gson gson = new GsonBuilder().create();
//		String json = gson.toJson(list);
//
//		resp.getWriter().print(json);
	}

}
