package com.camcam.notice.service;

import java.util.List;

import com.camcam.notice.vo.NoticeVO;

public interface NoticeService {
	
	//공지상황 리스트
	List<NoticeVO> noticeList();
	
	NoticeVO getNotice(int noticeNO);

}
