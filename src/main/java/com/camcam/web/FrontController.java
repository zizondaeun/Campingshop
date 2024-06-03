package com.camcam.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camcam.board.command.AddBoardControl;
import com.camcam.board.command.AddFormControl;
import com.camcam.board.command.BoardInfoControl;
import com.camcam.board.command.BoardInfoPwControl;
import com.camcam.board.command.BoardListControl;
import com.camcam.board.command.DeleteControl;
import com.camcam.board.command.ModifyControl;
import com.camcam.board.command.ModifyFormControl;
import com.camcam.cart.command.AddCartControl;
import com.camcam.cart.command.CartListControl;
import com.camcam.cart.command.GetCartListControl;
import com.camcam.cart.command.ModifyCartControl;
import com.camcam.cart.command.RemoveCartControl;
import com.camcam.cart.command.UserCartCntControl;
import com.camcam.cart.command.UserTotalCartCntControl;
import com.camcam.category.command.GetCategoryControl;
import com.camcam.common.Control;
import com.camcam.delivery.command.DeliManageControl;
import com.camcam.delivery.command.DeliveryStatusControl;
import com.camcam.home.command.HomeControl;
import com.camcam.likes.command.AddLikesControl;
import com.camcam.likes.command.RemoveLikesControl;
import com.camcam.likes.command.UserLikesCntControl;
import com.camcam.mypage.command.DeleteMyBoardControl;
import com.camcam.mypage.command.DeleteMyWishControl;
import com.camcam.mypage.command.MyBoardInfoControl;
import com.camcam.mypage.command.MyBoardListControl;
import com.camcam.mypage.command.MyBoardModFormControl;
import com.camcam.mypage.command.MyOrderDetailControl;
import com.camcam.mypage.command.MyOrderListControl;
import com.camcam.mypage.command.MyPageControl;
import com.camcam.mypage.command.MyWishItemRemoveControl;
import com.camcam.mypage.command.MyWishListControl;
import com.camcam.mypage.command.UpdateMyBoardControl;
import com.camcam.notice.command.AddnoticeControl;
import com.camcam.notice.command.AdminListnoticeControl;
import com.camcam.notice.command.ListnoticeControl;
import com.camcam.notice.command.UpdatenoticeControl;
import com.camcam.notice.command.UpdatenoticeForm;
import com.camcam.notice.command.addnoticeForm;
import com.camcam.notice.command.deletenoticeControl;
import com.camcam.notice.command.noticeControl;
import com.camcam.order.command.OrderControl;
import com.camcam.order.command.OrderFormControl;
import com.camcam.order.command.OrderInfoControl;
import com.camcam.order.command.OrderListControl;
import com.camcam.order.command.OrderSuccessControl;
import com.camcam.product.command.AddProductControl;
import com.camcam.product.command.AddProductFormControl;
import com.camcam.product.command.AddWishControl;
import com.camcam.product.command.ProductInfoControl;
import com.camcam.product.command.ProductListControl;
import com.camcam.product.command.productControl;
import com.camcam.reply.command.AddReplyControl;
import com.camcam.reply.command.RemoveReplyControl;
import com.camcam.reply.command.ReplyListControl;
import com.camcam.review.command.AddReviewControl;
import com.camcam.review.command.ReviewCountControl;
import com.camcam.review.command.ReviewListControl;
import com.camcam.review.command.UserReviewCountControl;
import com.camcam.user.command.CheckInControl;
import com.camcam.user.command.IdFindControl;
import com.camcam.user.command.IdFindFormControl;
import com.camcam.user.command.LoginControl;
import com.camcam.user.command.LoginFormControl;
import com.camcam.user.command.LogoutControl;
import com.camcam.user.command.MyinformationControl;
import com.camcam.user.command.MyinformationFormControl;
import com.camcam.user.command.PwFindControl;
import com.camcam.user.command.PwFindFormControl;
import com.camcam.user.command.SignInControl;
import com.camcam.user.command.SignInFormControl;
import com.camcam.user.command.UserListControl;
import com.camcam.user.command.WithdrawControl;
import com.camcam.user.command.WithdrawFormControl;

@WebServlet
public class FrontController extends HttpServlet {

	// 필드
	Map<String, Control> map;

	// 생성자.
	public FrontController() {
		map = new HashMap<>();
	}

	// init.
	@Override
	public void init(ServletConfig config) throws ServletException {
		// url패턴과 실행할 Control(인터페이스) 구현클래스 정의
		// 첫 화면
		map.put("/home.do", new HomeControl());

		// 제품 관련
		map.put("/productList.do", new ProductListControl()); // 제품 리스트
		map.put("/productInfo.do", new ProductInfoControl()); // 제품 상세보기

		// 리뷰 관련
		map.put("/reviewList.do", new ReviewListControl()); // 리뷰보기
		map.put("/addReview.do", new AddReviewControl()); // 리뷰작성
//		map.put("/modReview.do", new ModifyReviewControl()); // 리뷰수정
//		map.put("/removeReview.do", new RemoveReviewControl()); // 리뷰삭제
		map.put("/getReviewTotalCnt.do", new ReviewCountControl()); // 리뷰 총 개수
		map.put("/getUserReviewCnt.do", new UserReviewCountControl()); // 유저의 해당 제품에 다한 리뷰 수

		// 좋아요 변경 관련
		map.put("/addLikes.do", new AddLikesControl()); // 좋아요 추가
		map.put("/removeLikes.do", new RemoveLikesControl()); // 좋아요 추가
		map.put("/userLikesCnt.do", new UserLikesCntControl()); // 좋아요 여부 확인
		
		// 관심상품 등록
		map.put("/addWish.do", new AddWishControl()); 

		// 장바구니 관련
		map.put("/getCartList.do", new GetCartListControl()); // 장바구니 리스트 JSON 변환
		map.put("/cartList.do", new CartListControl()); // 장바구니 보기
		map.put("/addCart.do", new AddCartControl()); // 장바구니 담기
		map.put("/modCart.do", new ModifyCartControl()); // 장바구니 수정
		map.put("/removeCart.do", new RemoveCartControl()); // 장바구니 삭제
		map.put("/userTotalCartCnt.do", new UserTotalCartCntControl()); // 해당 물건이 장바구니에 담겨있는지 확인하기 위한 컨트롤
		map.put("/userCartCnt.do", new UserCartCntControl()); // 유저가 장바구니에 담은수

		// 주문 관련
		map.put("/order.do", new OrderControl()); // 주문 화면
		map.put("/orderList.do", new OrderListControl()); // 장바구니에서 주문 리스트 가져오기
		map.put("/orderInfo.do", new OrderInfoControl()); // 주문자 정보
		map.put("/orderForm.do", new OrderFormControl()); // 주문 처리
		map.put("/orderSuccess.do", new OrderSuccessControl()); // 주문 성공 페이지
//		map.put("/orderFailed.do", new OrderFailedControl()); // 주문 실패 페이지

		// 카테고리
		map.put("/getCategory.do", new GetCategoryControl());

		// 유저 관련(유저)
		map.put("/signInForm.do", new SignInFormControl()); // 회원가입 화면
		map.put("/signIn.do", new SignInControl()); // 회원가입 기능
		map.put("/checkUserId.do", new CheckInControl()); // 회원가입 아이디중복 기능
		map.put("/logForm.do", new LoginFormControl()); // 로그인 화면
		map.put("/login.do", new LoginControl()); // 로그인 기능
		map.put("/logout.do", new LogoutControl()); // 로그아웃 기능
		map.put("/withdrawForm.do", new WithdrawFormControl()); // 회원탈퇴 화면
		map.put("/withdraw.do", new WithdrawControl()); // 회원탈퇴 기능
		// 아이디/비밀번호 찾기
		map.put("/idFindForm.do", new IdFindFormControl()); // 아이디찾기 화면
		map.put("/idFind.do", new IdFindControl());// 아이디찾기 기능

		map.put("/pwFindForm.do", new PwFindFormControl());// 비밀번호 찾기 화면
		map.put("/pwFind.do", new PwFindControl()); // 비밀번호 찾기 비밀번호

		// 유저 관련(관리자)
		map.put("/userList.do", new UserListControl()); // 회원 리스트

		// 제품 관련(관리자)
		map.put("/addProductForm.do", new AddProductFormControl()); // 상품 등록화면
		map.put("/addProduct.do", new AddProductControl());
		map.put("/productList.do", new productControl());
		
		// 공지사항
		map.put("/ListnoticePage.do", new ListnoticeControl()); // 공지사항 리스트
		map.put("/noticePage.do", new noticeControl()); // 공지사항 상세화면 이동

		// 관리자 공지사항
		map.put("/adminListnoticePage.do", new AdminListnoticeControl()); // 공지사항 리스트
		map.put("/addnoticeForm.do", new addnoticeForm()); // 공지사항 등록으로 이동
		map.put("/addnoticePage.do", new AddnoticeControl()); // 공지사항 등록 기능
		map.put("/updatenoticeForm.do", new UpdatenoticeForm()); // 공지사항 수정 이동
		map.put("/updatenoticePage.do", new UpdatenoticeControl()); // 공지사항 수정 기능
		map.put("/deletedatenoticePage.do", new deletenoticeControl()); // 공지사항 삭제

		// 마이페이지
		map.put("/myPage.do", new MyPageControl()); // 마이페이지로 이동
		map.put("/myBoardList.do", new MyBoardListControl()); // 내 게시글 리스트로 이동
		map.put("/myBoardInfo.do", new MyBoardInfoControl()); // 내 게시판 상세화면으로 이동
		map.put("/myBoardMod.do", new MyBoardModFormControl()); // 내 게시글 수정 이동
		map.put("/updateMyboard.do", new UpdateMyBoardControl()); // 내 게시글 수정 기능
		map.put("/deleteMyboard.do", new DeleteMyBoardControl()); // 내 게시글 삭제 기능
		map.put("/myOrderList.do", new MyOrderListControl()); // 주문내역 리스트로 이동
		map.put("/myOrderDetail.do", new MyOrderDetailControl()); // 상세주문 내역 이동
		map.put("/myWishList.do", new MyWishListControl()); // 관심상품 리스트로 이동
		map.put("/deleteMywish.do", new DeleteMyWishControl()); // 관심상품 삭제 기능
		map.put("/mywishItemRemove.do", new MyWishItemRemoveControl()); // 관심상품 -> 장바구니 시 관심상품에서 삭제
		map.put("/myinformationForm.do", new MyinformationFormControl());// 개인정보수정 화면
		map.put("/myinformation.do", new MyinformationControl()); // 개인정보수정 기능

		// QnA
		map.put("/boardList.do", new BoardListControl()); // qna 게시판으로 이동(리스트)
		map.put("/boardInfoPw.do", new BoardInfoPwControl()); // qna 상세로 가기위한 pw 체크창으로 이동
		map.put("/boardInfo.do", new BoardInfoControl()); // qna 상세화면으로 이동
		map.put("/addForm.do", new AddFormControl()); // qna 글 등록으로 이동
		map.put("/addBoard.do", new AddBoardControl()); // qna 글 등록 기능
		map.put("/modBoardForm.do", new ModifyFormControl()); // qna 글 수정으로 이동
		map.put("/updateBoard.do", new ModifyControl()); // qna 글 수정 기능
		map.put("/deleteBoard.do", new DeleteControl()); // qna 글 삭제 기능
		// QnA 댓글 관련
		map.put("/replyList.do", new ReplyListControl()); // 댓글 목록
		map.put("/addReply.do", new AddReplyControl()); // 댓글 작성
		map.put("/removeReply.do", new RemoveReplyControl()); // 댓글 삭제

		// 배송관리
		map.put("/deliveryManage.do", new DeliManageControl());
		map.put("/deliveryState.do", new DeliveryStatusControl());
	}

	// service.
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		req.setCharacterEncoding("utf-8");
//		resp.setContentType("text/html;charset=utf-8"); //??
//		resp.setCharacterEncoding("utf-8"); // 요청정보 한글처리

		String uri = req.getRequestURI(); // url 에서 localhost 를 뺀
		String context = req.getContextPath(); // 프로젝트 이름
		System.out.println("uri: " + uri + ", context: " + context);
		String path = uri.substring(context.length());
		System.out.println(context.length());
		System.out.println("path: " + path); // 요청한 페이지

		Control control = map.get(path);
		control.exec(req, resp);
	}

	// destroy.
	@Override
	public void destroy() {

	}

}
