package com.camcam.board.mapper;

import java.util.List;

import com.camcam.board.vo.QnAVO;
import com.camcam.common.SearchVO;

public interface BoardMapper {
	//QnA 목록
	List<QnAVO> boardList();
	//QnA 페이징 목록
	List<QnAVO> boardListPaging(SearchVO search);
	//QnA 전체건수 계산
	int getTotalCnt(SearchVO search);
	
	//QnA 상세화면 전 pw체크
	QnAVO selectBoardPw(QnAVO vo);
	//QnA 글 등록
	int insertBoard(QnAVO vo);
	//QnA 글 수정
	int updateBoard(QnAVO vo);
	//QnA 글 삭제
	int deleteBoard(int boardNo);
	//관리자일때
	QnAVO selectAdmin(int boardNo);
	


}
