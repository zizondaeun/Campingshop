package com.camcam.board.vo;

import java.util.Date;

import lombok.Data;

@Data
public class QnAVO {
	private int boardNo;
	private String userId;
	private String title;
	private String content;
	private Date createDate;
	private String boardPw;
}
