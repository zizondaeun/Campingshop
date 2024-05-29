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
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json;charset=utf-8");
        
        String userId = req.getParameter("userId");
        String passWord = req.getParameter("passWord");
        String userName = req.getParameter("userName");
        String email = req.getParameter("email");
        String userTel = req.getParameter("userTel");
        String address = req.getParameter("address");

        UserService svc = new UserServiceImpl();

        UserVO user = new UserVO();
        user.setUserId(userId);
        user.setPassWord(passWord);
        user.setUserName(userName);
        user.setEmail(email);
        user.setUserTel(userTel);
        user.setAddress(address);

        Map<String, Object> result = new HashMap<>();
        boolean userExists = svc.checkUserId(userId);
        result.put("exists", userExists);

        if (userExists) {
            result.put("success", false);
            result.put("message", "이미 존재하는 아이디입니다.");
        } else if (svc.addUser(user)) {
            result.put("success", true);
            result.put("message", "회원가입 성공!");
        } else {
            result.put("success", false);
            result.put("message", "회원가입 실패. 다시 시도해주세요.");
        }
        
        Gson gson = new GsonBuilder().create();
        resp.getWriter().print(gson.toJson(result));
    }
}
