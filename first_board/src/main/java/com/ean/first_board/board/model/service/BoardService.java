package com.ean.first_board.board.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.ean.first_board.board.domain.Board;


public interface BoardService {
	
	public int insertBoard(Board board);
	
	public List<Board> selectBoardList();
	public List<Board> selectBoardList(int selectVal, RowBounds rowBounds);
	
	public Board selectBoard(int b_no);
	
	public int updateBoard(Board board);
	
	public int deleteBoard(int b_no);
}
