package com.camcam.mypage.mapper;

import com.camcam.user.vo.UserVO;

public interface MyPageMapper {
	//마이페이지
	UserVO selectMypage(String id);

}
