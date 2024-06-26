package com.camcam.reply.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.camcam.common.DataSource;
import com.camcam.common.SearchVO;
import com.camcam.reply.mapper.ReplyMapper;
import com.camcam.reply.service.ReplyService;
import com.camcam.reply.vo.ReplyVO;

public class ReplyServiceImpl implements ReplyService{
	SqlSession session = DataSource.getInstance().openSession(true); 
	ReplyMapper mapper = session.getMapper(ReplyMapper.class);
	
	@Override
	public List<ReplyVO> replyList(ReplyVO vo) {
		return mapper.selectReplyList(vo);
	}

	@Override
	public boolean addReply(ReplyVO rvo) {
		return mapper.insertReply(rvo) == 1;
	}

	@Override
	public boolean removeReply(int replyNo) {
		return mapper.deleteReply(replyNo) == 1;
	}

}
