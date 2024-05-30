package com.camcam.reply.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
	private int replyNo; 
	private int boardNo;
	private String reply; //댓글
	private Date rdate; //작성일
}
