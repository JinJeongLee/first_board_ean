package com.ean.first_board.board.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;

import com.ean.first_board.board.domain.Board;


public interface BoardService {
	
	public int insertBoard(Board board);
	
	public List<Board> selectBoardList(int selectVal, RowBounds rowBounds);
	public List<Board> selectBoardList(String searchVal, String searchOpt, int selectVal, RowBounds rowBounds);
	public int countBoard();

	//글 상세조회
	public Board selectBoard(int b_no);
	public List<Board> selectFile(int b_no);
	
	public int updateBoard(Board board);
	
	public int deleteBoard(int b_no);
	
	public int updateCount(int b_no);

//댓글
	//댓글쓰기
		public int insertComment(Board board);
	//댓글리스트
		public List<Board> selectCommentList(int b_no);
	//댓글 수정 삭제
		public int deleteComment(int c_no);
		public int updateComment(Board board);
		
//파일
	 /**
     * 과일 리스트를 간단한 엑셀 워크북 객체로 생성
     * @param list
     * @return 생성된 워크북
     */	
	public SXSSFWorkbook makeSimpleboardExcelWorkbook(List<Board> list);
	
	/**
     * 생성한 엑셀 워크북을 컨트롤레에서 받게해줄 메소
     * @param list
     * @return
     */
    public SXSSFWorkbook excelFileDownloadProcess(List<Board> list);
	
}
