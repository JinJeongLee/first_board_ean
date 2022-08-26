package com.ean.first_board.board.model.dao;


import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ean.first_board.board.domain.Board;



@Repository
public class BoardDao {
	
	@Autowired
	private SqlSession sqlsession;
	 
	// 게시글 작성
		public int insertBoard(Board board) {
			return sqlsession.insert("Board.insertBoard", board);
		}
	// 게시글 리스트
//		public List<Board> selectBoardList(){
//			return sqlsession.selectList("Board.selectBoardList");
//		}
		public List<Board> selectBoardList(int selectVal, RowBounds rowBounds){
			return sqlsession.selectList("Board.selectBoardList", selectVal ,rowBounds);
		}
		public int countBoard() {
			return sqlsession.selectOne("Board.countBoard");
		}
	// 게시글 읽기
		public Board selectBoard(int b_no) {
			return sqlsession.selectOne("Board.selectBoard", b_no);
		}
	//글 수정
		public int updateBoard(Board board) {
			return sqlsession.update("Board.updateBoard", board);
		}
	//글 삭제
		public int deleteBoard(int b_no) {
			return sqlsession.update("Board.deleteBoard", b_no);
		}
}
