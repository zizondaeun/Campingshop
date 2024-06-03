package com.camcam.user.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.camcam.user.vo.UserVO;

public interface UserMapper {
	int insertUser(UserVO user); //회원가입
	 int selectUserCountById(String userId); //아이디 중복체크
	 
	 List<UserVO> selectUserList(); // 관리자 유저목록
	 
	 UserVO selectMember(@Param("id") String id, @Param("pw") String pw); //로그인
	 UserVO selectMember2(String id);
	 UserVO selectLoginForm(String id);
	 
	 UserVO selectIdFined(@Param("userName") String userName, @Param("userTel") String userTel); // 아이디 찾기	
	 UserVO selectPwFined(@Param("userId") String userId, @Param("userName")String userName,@Param("userTel") String userTel);
	 
	 int updateUser(UserVO userId);//개인정보수정
	 int deleteUser(@Param("userId") String userId, @Param("passWord") String passWord);//아이디삭제
	 
	  UserVO selectUser(String userId);
	 
}
