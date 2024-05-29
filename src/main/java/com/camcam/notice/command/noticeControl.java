package com.camcam.notice.command;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.camcam.common.Control;
import com.camcam.notice.service.NoticeService;
import com.camcam.notice.service.impl.NoticeServiceImpl;
import com.camcam.notice.vo.NoticeVO;

public class noticeControl implements Control {

    @Override
    public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = "admin/noticeDetail.tiles"; // 상세 페이지의 경로
        String noticeNo = req.getParameter("noticeNo"); // 공지사항 번호를 파라미터로 받음

        NoticeService svc = new NoticeServiceImpl();
        NoticeVO notice = svc.getNotice(Integer.parseInt(noticeNo)); // 공지사항 번호로 상세 정보 조회

        req.setAttribute("notice", notice); // 조회된 정보를 JSP에 전달

        req.getRequestDispatcher(path).forward(req, resp); // JSP로 포워드
    }
}
