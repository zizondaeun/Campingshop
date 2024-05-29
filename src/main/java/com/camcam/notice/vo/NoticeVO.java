package com.camcam.notice.vo;

import lombok.Data;

@Data
public class NoticeVO {
	private int noticeNo;
	private String userId;
	private String noticeSubject;
	private String noticeContent;
	private String noticeDate;
}
