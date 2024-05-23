package com.camcam.user.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camcam.common.Control;
import com.camcam.user.service.UserService;
import com.camcam.user.service.impl.UserServiceImpl;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class CheckInControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String userId = req.getParameter("userId");

		UserService svc = new UserServiceImpl();
        
        System.out.println(userId);
        
        Map<String, Object> result = new HashMap<>();
        
        // 중복 여부에 따라 응답 처리
        if(svc.checkUserId(userId))  {
            // 중복된 경우
            result.put("status", "DUPLICATED");
        } else {
            // 중복되지 않은 경우
            result.put("status", "NOT_DUPLICATED");
        }
        
        // JSON 형태로 응답
        Gson gson = new GsonBuilder().create();
        resp.getWriter().print(gson.toJson(result));
		
	}

}


