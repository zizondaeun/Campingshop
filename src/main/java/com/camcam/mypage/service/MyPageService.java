package com.camcam.mypage.service;

import java.util.List;

import com.camcam.board.vo.QnAVO;
import com.camcam.cart.vo.CartVO;
import com.camcam.delivery.vo.DeliveryVO;
import com.camcam.mypage.vo.PageVO;
import com.camcam.order.vo.OrderDetailVO;
import com.camcam.order.vo.OrderVO;
import com.camcam.product.vo.ProductVO;
import com.camcam.user.vo.UserVO;

public interface MyPageService {
	//마이페이지 
	UserVO getMypage(String id);
	//내 게시판
	List<QnAVO> getMyboard(PageVO vo); //
	//내 게시글 상세보기
	QnAVO getBoardNo(int boardNo); //게시글 조회
	QnAVO getBoardNo(int boardNo, String pw); //수정하기위한 조회
	//내 게시글 수정,삭제 위한 bno,pw가져오는거
	boolean removeMyboard(int bno, String pw);
	//내 게시글 수정
	boolean modifyMyboard(QnAVO vo);
	//내 주문내역 목록
	List<OrderVO> getMyorder(PageVO vo); //
	//상세주문 내역
	List<OrderDetailVO> getOrderDetail(int ono);
	//내 관심상품 목록
	List<ProductVO> getMywish(PageVO vo); //
	//관심상품 삭제
	boolean removeMywish(ProductVO vo);
	//내 배송정보 내역
	List<DeliveryVO> getMydelivery(PageVO vo);
	//페이징
	int getBoardTotal(PageVO vo); //board
	int getOrderTotal(PageVO vo); //order
	int getWishTotal(PageVO vo); //wish
	int getDeliTotal(PageVO vo); //delivery
	
	

}
