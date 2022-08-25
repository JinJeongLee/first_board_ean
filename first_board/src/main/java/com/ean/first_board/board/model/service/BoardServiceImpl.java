package com.ean.first_board.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ean.first_board.board.domain.Board;
import com.ean.first_board.board.model.dao.BoardDao;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDao dao;
	
	@Override
	public int insertBoard(Board board){
		return dao.insertBoard(board);
	}

	@Override
	public List<Board> selectBoardList() {
		return dao.selectBoardList();
	}

	@Override
	public Board selectBoard(int b_no) {
		return dao.selectBoard(b_no);
	}

	@Override
	public int updateBoard(Board board) {
		return dao.updateBoard(board);
	}

	@Override
	public int deleteBoard(int b_no) {
		return dao.deleteBoard(b_no);
	}
	

	
}
