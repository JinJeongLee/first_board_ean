package com.ean.first_board.board.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
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
	
// 파일

    
    /**
     * 과일 리스트를 간단한 엑셀 워크북 객체로 생성
     * @param list
     * @return 생성된 워크북
     */
    @Override
    public SXSSFWorkbook makeSimpleboardExcelWorkbook(List<Board> list) {
        SXSSFWorkbook workbook = new SXSSFWorkbook();
        
        // 시트 생성
        SXSSFSheet sheet = workbook.createSheet("게시판");
        
        //시트 열 너비 설정
        sheet.setColumnWidth(0, 1500);
        sheet.setColumnWidth(0, 1500);
        sheet.setColumnWidth(0, 3000);
        sheet.setColumnWidth(0, 9000);
        sheet.setColumnWidth(0, 1500);
        sheet.setColumnWidth(0, 3000);
        sheet.setColumnWidth(0, 6000);
        sheet.setColumnWidth(0, 1500);
        
        // 헤더 행 생
        Row headerRow = sheet.createRow(0);
        // 해당 행의 첫번째 열 셀 생성
        Cell headerCell = headerRow.createCell(0);
        headerCell.setCellValue("No");
        // 해당 행의 두번째 열 셀 생성
        headerCell = headerRow.createCell(1);
        headerCell.setCellValue("글 번호");
        // 해당 행의 두번째 열 셀 생성
        headerCell = headerRow.createCell(2);
        headerCell.setCellValue("글 종류");
        // 해당 행의 세번째 열 셀 생성
        headerCell = headerRow.createCell(3);
        headerCell.setCellValue("글 제목");
        // 해당 행의 네번째 열 셀 생성
        headerCell = headerRow.createCell(4);
        headerCell.setCellValue("첨부파일 갯수");
        // 해당 행의 다섯번째 열 셀 생성
        headerCell = headerRow.createCell(5);
        headerCell.setCellValue("작성자");
        // 해당 행의 여섯번째 열 셀 생성
        headerCell = headerRow.createCell(6);
        headerCell.setCellValue("작성일");
        // 해당 행의 여섯번째 열 셀 생성
        headerCell = headerRow.createCell(7);
        headerCell.setCellValue("조회수");
        
        // 표 내용 행 및 셀 생성
        Row bodyRow = null;
        Cell bodyCell = null;
        for(int i=0; i<list.size(); i++) {
            Board board = list.get(i);
            
            // 행 생성
            bodyRow = sheet.createRow(i+1);
            // 데이터 번호 표시
            bodyCell = bodyRow.createCell(0);
            bodyCell.setCellValue(i + 1);
            // 데이터 번호 표시
            bodyCell = bodyRow.createCell(1);
            bodyCell.setCellValue(board.getB_no());
            // 데이터 2 표시
            bodyCell = bodyRow.createCell(2);
            bodyCell.setCellValue(board.getBt_name());
            // 데이터 3 표시
            bodyCell = bodyRow.createCell(3);
            bodyCell.setCellValue(board.getB_title());
            // 데이터 4 표시
            bodyCell = bodyRow.createCell(4);
            bodyCell.setCellValue(board.getF_count());
            // 데이터 5 표시
            bodyCell = bodyRow.createCell(5);
            bodyCell.setCellValue(board.getB_writer());
            // 데이터 6 표시
            bodyCell = bodyRow.createCell(6);
            bodyCell.setCellValue(board.getB_write_date());
            // 데이터 7 표시
            bodyCell = bodyRow.createCell(7);
            bodyCell.setCellValue(board.getB_count());
        }
        
        return workbook;
    }
    
    /**
     * 생성한 엑셀 워크북을 컨트롤레에서 받게해줄 메소
     * @param list
     * @return
     */
    @Override
    public SXSSFWorkbook excelFileDownloadProcess(List<Board> list) {
        return this.makeSimpleboardExcelWorkbook(list);
    }
}
