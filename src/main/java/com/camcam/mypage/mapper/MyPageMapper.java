package com.camcam.mypage.mapper;

import java.util.List;

import com.camcam.product.vo.QnAVO;
import com.camcam.user.vo.UserVO;

public interface MyPageMapper {
	//마이페이지
	UserVO selectMypage(String id);
	//내 게시판관리
	List<QnAVO> selectMyboard(String id);

}
