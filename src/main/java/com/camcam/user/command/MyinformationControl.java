package com.camcam.user.command;

import java.io.IOException;
import java.util.List;

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
            // UserService를 사용하여 사용자 목록을 가져옵니다.
            UserService userService = new UserServiceImpl();
            List<UserVO> userList = userService.userList();

            // 사용자 목록에서 현재 로그인한 사용자를 찾습니다.
            UserVO currentUser = null;
            for (UserVO user : userList) {
                if (userId.equals(user.getUserId())) {
                    currentUser = user;
                    break;
                }
            }

            if (currentUser != null) {
                // 사용자 정보를 세션에 저장합니다.
                session.setAttribute("userName", currentUser.getUserName());
                session.setAttribute("email", currentUser.getEmail());
                session.setAttribute("userTel", currentUser.getUserTel());
                session.setAttribute("address", currentUser.getAddress());

                // 이후에 JSP에서 사용자 정보를 가져올 수 있습니다.
                req.getRequestDispatcher("/mypage.jsp").forward(req, resp);
            } else {
                // 사용자 정보를 찾지 못한 경우, 로그인 페이지로 리다이렉션합니다.
                resp.sendRedirect("logForm.do");
            }
        } else {
            resp.sendRedirect("logForm.do");
        }
    }
}
