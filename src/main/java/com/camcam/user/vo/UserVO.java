package com.camcam.user.vo;

import lombok.Data;
import oracle.sql.DATE;

@Data
public class UserVO {
	private String userId;
	private String passWord;
	private String userName;
	private String email;
	private String userTel;
	private String hireDate;
	private String userResp;
	private String address;
	
	
}
