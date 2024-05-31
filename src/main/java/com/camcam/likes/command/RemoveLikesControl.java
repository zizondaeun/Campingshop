package com.camcam.likes.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.camcam.common.Control;
import com.camcam.likes.service.LikesService;
import com.camcam.likes.service.impl.LikeServiceImpl;
import com.camcam.product.vo.ProductVO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class RemoveLikesControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
req.setCharacterEncoding("UTF-8");
		
		// 넘어와야할 파라미터 : pno
		HttpSession session = req.getSession();
		String userId = (String) session.getAttribute("logId");
		String pno = req.getParameter("pno");
		
		ProductVO product = new ProductVO();
		product.setUserId(userId);
		product.setProductNo(Integer.parseInt(pno));
		LikesService likeService = new LikeServiceImpl();
		Map<String, Object> result = new HashMap<>();
		if(likeService.removeLike(product)) {
			result.put("retCode", "OK");
		} else {
			result.put("retCode", "NG");
		}
		
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(result);
		
		resp.getWriter().print(json);
		
	}

}
