package com.camcam.board.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camcam.board.service.BoardService;
import com.camcam.board.service.impl.BoardServiceImpl;
import com.camcam.board.vo.QnAVO;
import com.camcam.common.Control;
import com.camcam.common.HttpUtils;
import com.camcam.common.PageDTO;
import com.camcam.common.SearchVO;

public class BoardListControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = "board/boardList.tiles";
		
		SearchVO search = new SearchVO();
		String page = req.getParameter("page");
		String sc = req.getParameter("searchCondition");
		String kw = req.getParameter("keyword");
		
		page = page == null ? "1" : page;
		search.setPage(Integer.parseInt(page));
		search.setKeyword(kw); 
		search.setSearchCondition(sc);
		
		BoardService svc = new BoardServiceImpl();
		List<QnAVO> list = svc.boardList(search); //pagevo에 있는 id는 필요없어서 pagedto로
		PageDTO pageDTO = new PageDTO(Integer.parseInt(page), svc.getTotal(search));
		
		req.setAttribute("boardList", list);
		req.setAttribute("paging", pageDTO);
		req.setAttribute("searchCondition", sc);
		req.setAttribute("keyword", kw);
		
		//req.getRequestDispatcher(path).forward(req, resp);
		HttpUtils.forward(req, resp, path);
	}

}
