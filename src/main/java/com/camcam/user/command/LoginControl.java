package com.camcam.user.command;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.camcam.common.Control;
import com.camcam.user.service.UserService;
import com.camcam.user.service.impl.UserServiceImpl;
import com.camcam.user.vo.UserVO;

public class LoginControl implements Control {

    @Override
    public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 요청에서 사용자 ID와 비밀번호를 가져옵니다.
        String id = req.getParameter("id");
        String pw = req.getParameter("pw");

        // 디버깅을 위해 ID를 출력합니다.
        System.out.println(id + "****************************");
        System.out.println(pw + "****************************");

        // UserService 인스턴스를 생성합니다.
        UserService svc = new UserServiceImpl();

        // 사용자 로그인을 시도합니다.
        UserVO uvo = svc.login(id, pw);

        if (uvo != null) {
            // 로그인 성공 시 세션에 사용자 ID를 저장합니다.
            HttpSession session = req.getSession();
            session.setAttribute("logId", uvo.getUserId());

            // 사용자의 권한에 따라 리다이렉트 경로를 결정합니다.
            String userResp = uvo.getUserResp();
            if ("Admin".equals(userResp)) {
                resp.sendRedirect("userList.do");
            } else {
                // 로그인 성공시 home.do로 이동합니다.
                resp.sendRedirect("home.do");
                // 로그인 성공 메시지를 클라이언트에게 보냅니다.
                sendResponse(resp, "로그인 성공!!");
            }
        } else {
            // 로그인 실패 메시지를 클라이언트에게 보냅니다.
            sendResponse(resp, "로그인 실패!!");
        }
    }

    // 클라이언트에게 메시지를 보내는 메소드
    private void sendResponse(HttpServletResponse resp, String message) throws IOException {
        resp.setContentType("text/html; charset=UTF-8");
        PrintWriter out = resp.getWriter();
        out.println("<script>");
        out.println("alert('" + message + "');");
        out.println("location.href='logForm.do';");
        out.println("</script>");
        out.close();
    }
}
