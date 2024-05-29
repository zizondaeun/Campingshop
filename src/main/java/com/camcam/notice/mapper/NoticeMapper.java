package com.camcam.notice.mapper;

import java.util.List;

import com.camcam.notice.vo.NoticeVO;

public interface NoticeMapper {

	//공지상항 목록
	List<NoticeVO> noticeList();
	//공지사항 상세화면 
	NoticeVO selectNotice(int noticeNo);
}
