package com.camcam.mypage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.camcam.order.vo.OrderDetailVO;
import com.camcam.order.vo.OrderVO;
import com.camcam.product.vo.ProductVO;
import com.camcam.product.vo.QnAVO;
import com.camcam.user.vo.UserVO;

public interface MyPageMapper {
	// 마이페이지
	UserVO selectMypage(String id);

	// 내 게시판 리스트
	List<QnAVO> selectMyboard(String id);

	// 내 게시글 상세
	QnAVO selectBoardNo(@Param("boardNo") int boardNo, @Param("pw") String pw);

	// 게시글 pw찾기(bno를 통해)
	String getBoardpw(int bno);

	// 내 게시글 삭제
	int deleteBoardNo(int boardNo);

	// 내 게시글 수정
	int updateBoardNo(QnAVO vo);

	// 내 주문내역 리스트
	List<OrderVO> selectMyorder(String id);
	// 상세 주문 내역
	List<OrderDetailVO> selectDetail(int ono);
	// 내 관심상품 리스트
	List<ProductVO> selectMywish(String id);
}
