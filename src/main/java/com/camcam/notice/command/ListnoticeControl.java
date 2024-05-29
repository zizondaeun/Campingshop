package com.camcam.notice.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camcam.common.Control;
import com.camcam.notice.service.NoticeService;
import com.camcam.notice.service.impl.NoticeServiceImpl;
import com.camcam.notice.vo.NoticeVO;

public class ListnoticeControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String path = "admin/noticeList.tiles";
		

		
		NoticeService nvc = new NoticeServiceImpl();
		List<NoticeVO> list = nvc.noticeList();
		
		req.setAttribute("noticeList", list);
		
		req.getRequestDispatcher(path).forward(req, resp);

	}

}
