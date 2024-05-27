package com.camcam.user.command;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.camcam.common.Control;
import com.camcam.user.vo.UserVO;
import com.camcam.user.service.UserService;
import com.camcam.user.service.impl.UserServiceImpl;

public class MyinformationControl implements Control {

    @Override
    public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");

        HttpSession session = req.getSession();
        String userId = (String) session.getAttribute("logId");

        if (userId != null) {
            // UserService를 사용하여 사용자 정보를 가져옵니다.
            UserService userService = new UserServiceImpl();
            UserVO currentUser = userService.getUserById(userId);

            if (currentUser != null) {
                // 사용자 정보가 있을 경우

                // 사용자 정보 출력을 위한 변수 설정
                String userName = currentUser.getUserName();
                String userEmail = currentUser.getEmail();
                String userTel = currentUser.getUserTel();
                String userAddress = currentUser.getAddress();

                // 사용자 정보 출력
                System.out.println("이름: " + userName);
                System.out.println("이메일: " + userEmail);
                System.out.println("전화번호: " + userTel);
                System.out.println("주소: " + userAddress);
            } else {
                // 사용자 정보가 없을 경우 처리
            }
        } else {
            // 로그인되지 않은 경우 처리
        }
    }
}



        
   
  
