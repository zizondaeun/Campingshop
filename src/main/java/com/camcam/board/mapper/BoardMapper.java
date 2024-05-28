package com.camcam.board.mapper;

import java.util.List;

import com.camcam.board.vo.QnAVO;

public interface BoardMapper {
	//QnA 목록
	List<QnAVO> boardList();
	//QnA 상세화면
	QnAVO selectBoard(int boardNo);


}
