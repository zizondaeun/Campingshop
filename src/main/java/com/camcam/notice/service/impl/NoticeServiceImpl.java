package com.camcam.notice.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.camcam.common.DataSource;
import com.camcam.notice.mapper.NoticeMapper;
import com.camcam.notice.service.NoticeService;
import com.camcam.notice.vo.NoticeVO;

public class NoticeServiceImpl implements NoticeService{
	
	SqlSession session = DataSource.getInstance().openSession(true); //맵퍼작업해주는게 session /자동커밋
	NoticeMapper mapper = session.getMapper(NoticeMapper.class);
	@Override
	public List<NoticeVO> noticeList() {
		// TODO Auto-generated method stub
		return mapper.noticeList();
	}
	@Override
	public NoticeVO getNotice(int noticeNO) {
		// TODO Auto-generated method stub
		return mapper.selectNotice(noticeNO);
	}
	
}
