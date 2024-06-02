package com.camcam.board.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.camcam.board.mapper.BoardMapper;
import com.camcam.board.service.BoardService;
import com.camcam.board.vo.QnAVO;
import com.camcam.common.DataSource;
import com.camcam.common.SearchVO;

public class BoardServiceImpl implements BoardService {
	
	SqlSession session = DataSource.getInstance().openSession(true); //맵퍼작업해주는게 session /자동커밋
	BoardMapper mapper = session.getMapper(BoardMapper.class);
	
	@Override
	public List<QnAVO> boardList(SearchVO search) {
		return mapper.boardListPaging(search);
	}

	@Override
	public int getTotal(SearchVO search) {
		return mapper.getTotalCnt(search);
	}

//	@Override
//	public QnAVO getBoard(QnAVO vo) {
//		return mapper.selectBoard(vo);
//	}

	@Override
	public QnAVO getBoardPw(QnAVO vo) {
		return mapper.selectBoardPw(vo);
	}

	@Override
	public boolean addBoard(QnAVO vo) {
		return mapper.insertBoard(vo) == 1;
	}

	@Override
	public boolean modifyBoard(QnAVO vo) {
		return mapper.updateBoard(vo) == 1;
	}

	@Override
	public boolean removeBoard(int boardNo) {
		return mapper.deleteBoard(boardNo) == 1;
	}

	@Override
	public QnAVO getAdmin(int boardNo) {
		return mapper.selectAdmin(boardNo);
	}
}
