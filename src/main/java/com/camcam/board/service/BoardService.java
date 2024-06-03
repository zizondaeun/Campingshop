package com.camcam.board.service;

import java.util.List;

import com.camcam.board.vo.QnAVO;
import com.camcam.common.SearchVO;

public interface BoardService {
	//QnA 목록
	List<QnAVO> boardList(SearchVO search);
	//페이징 전체건수
	int getTotal(SearchVO search);
	
	//QnA 상세화면 전 pw체크
	QnAVO getBoardPw(QnAVO vo);
	//QnA 글 등록
	boolean addBoard(QnAVO vo);
	//QnA 글 수정
	boolean modifyBoard(QnAVO vo);
	//QnA 글 삭제
	boolean removeBoard(int boardNo);
	//관리자일때
	QnAVO getAdmin(int boardNo);

	
}
