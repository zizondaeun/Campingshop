package com.camcam.board.service;

import java.util.List;

import com.camcam.board.vo.QnAVO;

public interface BoardService {
	//QnA 목록
	List<QnAVO> boardList();
	//QnA 상세화면
	QnAVO getBoard(int boardNo);
	
}
