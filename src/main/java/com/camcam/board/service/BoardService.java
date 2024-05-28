package com.camcam.board.service;

import java.util.List;

import com.camcam.board.vo.QnAVO;

public interface BoardService {
	//게시판 목록
	List<QnAVO> boardList();
	
}
