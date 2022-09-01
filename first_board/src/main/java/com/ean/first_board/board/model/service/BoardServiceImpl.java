package com.ean.first_board.board.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	public List<Board> selectBoardList(int selectVal, RowBounds rowBounds) {
		return dao.selectBoardList(selectVal, rowBounds);
	}
	@Override
	public List<Board> selectBoardList(String searchVal, String searchOpt, int selectVal, RowBounds rowBounds) {
		return dao.selectBoardList(searchVal, searchOpt, selectVal, rowBounds);
	}
	@Override
	public int countBoard() {
		return dao.countBoard();
	}

	//글 상세조회
	@Override
	public Board selectBoard(int b_no) {
		return dao.selectBoard(b_no);
	}
	@Override
	public List<Board> selectFile(int b_no){
		return dao.selectFile(b_no);
	}

	@Override
	public int updateBoard(Board board) {
		return dao.updateBoard(board);
	}

	@Override
	public int deleteBoard(int b_no) {
		return dao.deleteBoard(b_no);
	}

	@Override
	public int updateCount(int b_no) {
		return dao.updateCount(b_no);
	}
	
//댓글
	//댓글쓰기
	@Override
	@Transactional
	public int insertComment(Board board) {
		int result = dao.updateCommentSeq(board);
		result += dao.insertComment(board);
		return result;
	}
	//댓글리스트
	@Override
	public List<Board> selectCommentList(int b_no) {
		return dao.selectCommentList(b_no);
	}
	//댓글 수정삭제
	@Override
	public int deleteComment(int c_no) {
		return dao.deleteComment(c_no);
	};
	@Override
	public int updateComment(Board board) {
		return dao.updateComment(board);
	};
}
