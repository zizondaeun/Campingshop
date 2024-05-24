package com.camcam.user.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.camcam.user.vo.UserVO;

public interface UserMapper {
	int insertUser(UserVO user); //회원가입
	 int selectUserCountById(String userId); //아이디 중복체크
	 
	 List<UserVO> selectUserList();
	 
	 UserVO selectMember(@Param("id") String id, @Param("pw") String pw);
	 UserVO selectMember2(String id);
	 

}
