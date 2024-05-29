package com.camcam.board.service;

import java.util.List;

import com.camcam.board.vo.QnAVO;
import com.camcam.common.SearchVO;

public interface BoardService {
	//QnA 목록
	List<QnAVO> boardList(SearchVO search);
	//페이징 전체건수
	int getTotal(SearchVO search);
	
	//QnA 상세화면
	QnAVO getBoard(int boardNo);

	
}
