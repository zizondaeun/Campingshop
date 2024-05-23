package com.camcam.mypage.mapper;

import java.util.List;

import com.camcam.order.vo.OrderVO;
import com.camcam.product.vo.QnAVO;
import com.camcam.user.vo.UserVO;

public interface MyPageMapper {
	//마이페이지
	UserVO selectMypage(String id);
	//내 게시판관리
	List<QnAVO> selectMyboard(String id);
	//내 게시글 상세
	QnAVO selectBoardNo(int boardNo);
	//내 게시글 삭제
	int deleteBoardNo(int boardNo);
	//내 주문내역
	List<OrderVO> selectMyorder();
	//게시글 pw찾기(bno를 통해)
	String getBoardpw(int bno);

}
