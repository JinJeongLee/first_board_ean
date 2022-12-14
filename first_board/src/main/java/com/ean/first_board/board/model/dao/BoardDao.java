package com.ean.first_board.board.model.dao;


import java.util.HashMap;
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
		public List<Board> selectBoardList(String searchVal, String searchOpt, int selectVal, RowBounds rowBounds){
			HashMap<String, Object> map= new HashMap<>();
			map.put("searchVal", searchVal);
			map.put("searchOpt", searchOpt);
			map.put("selectVal", selectVal);
			return sqlsession.selectList("Board.selectBoardList", map ,rowBounds);
		}
		public List<Board> selectBoardList(int selectVal, RowBounds rowBounds){
			HashMap<String, Object> map= new HashMap<>();
			map.put("selectVal", selectVal);
			return sqlsession.selectList("Board.selectBoardList", map ,rowBounds);
		}
		public int countBoard() {
			return sqlsession.selectOne("Board.countBoard");
		}
	// 게시글 읽기
		public Board selectBoard(int b_no) {
			return sqlsession.selectOne("Board.selectBoard", b_no);
		}
		public List<Board> selectFile(int b_no) {
			return sqlsession.selectList("Board.selectFile", b_no);
		}
		
	//글 수정
		public int updateBoard(Board board) {
			return sqlsession.update("Board.updateBoard", board);
		}
	//글 삭제
		public int deleteBoard(int b_no) {
			return sqlsession.delete("Board.deleteBoard", b_no);
		}
		
	//조회수
		public int updateCount(int b_no) {
			return sqlsession.update("Board.updateCount", b_no);
		}
		
//댓글
	//댓글쓰기
		public int insertComment(Board board) {
			return sqlsession.insert("Board.insertComment", board);
		}
		public int updateCommentSeq(Board board) {
			return sqlsession.update("Board.updateCommentSeq", board);
		}
		
	//댓글리스트
		public List<Board> selectCommentList(int b_no) {
			return sqlsession.selectList("Board.selectCommentList", b_no);
		}
	//댓글 수정삭제
		public int deleteComment(int c_no) {
			return sqlsession.delete("Board.deleteComment", c_no);
		}
		public int updateComment(Board board) {
			return sqlsession.update("Board.updateComment", board);
		}
}
