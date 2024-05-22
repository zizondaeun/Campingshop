package com.camcam.mypage.service;

import java.util.List;

import com.camcam.product.vo.QnAVO;
import com.camcam.user.vo.UserVO;

public interface MyPageService {
	//마이페이지 
	UserVO getMypage(String id);
	//게시판
	List<QnAVO> getMyboard(String id);

}
