package com.camcam.mypage.service;

import java.util.List;

import com.camcam.product.vo.QnAVO;
import com.camcam.user.vo.UserVO;

public interface MyPageService {
	//마이페이지 
	UserVO getMypage(String id);
	//내 게시판
	List<QnAVO> getMyboard(String id);
	//내 게시글 상세보기
	QnAVO getBoardNo(int boardNo);
	//내 게시글 삭제하기
	boolean removeMyboard(int boardNo);
	//내 주문내역 목록
	List<UserVO> getMyorder();

}
