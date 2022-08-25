package com.ean.first_board.board.model.service;

import java.util.List;

import com.ean.first_board.board.domain.Board;


public interface BoardService {
	
	public int insertBoard(Board board);
	
	public List<Board> selectBoardList();
	
	public Board selectBoard(int b_no);
}
