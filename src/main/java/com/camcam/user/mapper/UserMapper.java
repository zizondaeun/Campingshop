package com.camcam.user.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.camcam.user.vo.UserVO;

public interface UserMapper {
	int insertUser(UserVO user); //회원가입
	 int selectUserCountById(String userId); //아이디 중복체크
	 
	 List<UserVO> selectUserList();
	 
	 UserVO selectMember(@Param("id") String id, @Param("pw") String pw); //로그인
	 UserVO selectMember2(String id);
	 
	 UserVO selectIdFined(@Param("userName") String userName, @Param("userTel") String userTel); // 아이디 찾기	
	 UserVO selectPwFined(@Param("userId") String userId, @Param("userName")String userName,@Param("userTel") String userTel);
	 
	 

}
