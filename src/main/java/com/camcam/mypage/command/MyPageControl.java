package com.camcam.mypage.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camcam.common.Control;
import com.camcam.delivery.vo.DeliveryVO;
import com.camcam.mypage.service.MyPageService;
import com.camcam.mypage.service.impl.MyPageServiceImpl;

public class MyPageControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("userId");
		//System.out.println(id + "119");
		MyPageService svc = new MyPageServiceImpl();
		//UserVO vo = svc.getMypage(id);

		List<DeliveryVO> list = svc.getMydelivery(id);
		//req.setAttribute("result", vo);
		req.setAttribute("list", list);
		//System.out.println(list + "1004");
		
		String path = "mypage/mypage.tiles";
		req.getRequestDispatcher(path).forward(req, resp);
		//HttpUtils.forward(req, resp, path);
		
	}

}
