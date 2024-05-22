package com.camcam.mypage.service;

import com.camcam.user.vo.UserVO;

public interface MyPageService {
	//마이페이지 
	UserVO getMypage(String id);
	//게시판
	UserVO getMyboard(String id);

}
