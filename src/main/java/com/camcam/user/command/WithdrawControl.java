package com.camcam.user.command;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.camcam.common.Control;
import com.camcam.user.service.UserService;
import com.camcam.user.service.impl.UserServiceImpl;
import com.camcam.user.vo.UserVO;

public class WithdrawControl implements Control {

    @Override
    public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        HttpSession session = req.getSession();
        String logId = (String) session.getAttribute("logId");
        String password = req.getParameter("password");
        
        System.out.println(logId + "******************************************************************");
        System.out.println(password + "***********########################&&&&&&&&&&&&&&&&&&&&&&&&&");
        
        UserService svc = new UserServiceImpl();
        UserVO user = svc.loginFinds(logId);

        if (user != null && user.getPassWord().equals(password)) {
            boolean result = svc.modifyUser(logId, password);

            if (result) {
                session.invalidate();
                req.setAttribute("message", "회원 탈퇴가 완료되었습니다.");
                resp.sendRedirect("home.do");
          
        } else {
            req.setAttribute("error", "비밀번호가 일치하지 않습니다.");
            req.getRequestDispatcher("mypage/dropUser.tiles").forward(req, resp);
        }
        }
    }
}

