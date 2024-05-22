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
import com.camcam.user.vo.UserVO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class SignInControl implements Control {

    @Override
    public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json;charset=utf-8");

        String userId = req.getParameter("userId");
        String passWord = req.getParameter("passWord");
        String userName = req.getParameter("userName");
        String email = req.getParameter("email");
        String userTel = req.getParameter("userTel");
        String address = req.getParameter("address");

        
        
        UserVO user = new UserVO();
        user.setUserId(userId);
        user.setPassWord(passWord);
        user.setUserName(userName);
        user.setEmail(email);
        user.setUserTel(userTel);
        user.setAddress(address);
      
        

        UserService svc = new UserServiceImpl();
        Map<String, Object> result = new HashMap<>();

        if (svc.addUser(user)) {
            // 회원 가입 성공 시 로그인 페이지로 리다이렉트
            resp.sendRedirect("logForm.do");
        } else {
            // 실패 시 JSON 응답
            result.put("retCode", "NG");
            result.put("retVal", null);
            Gson gson = new GsonBuilder().create();
            String json = gson.toJson(result);
            resp.getWriter().print(json);
        }
    }
}
