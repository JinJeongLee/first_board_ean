package com.ean.first_board.board.domain;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

@Component
public class Board {

//	B_NO         NOT NULL NUMBER         
//	B_TITLE      NOT NULL VARCHAR2(100)  
//	B_CONTENT    NOT NULL VARCHAR2(1000) 
//	B_WRITER     NOT NULL VARCHAR2(60)   
//	B_WRITE_DATE NOT NULL TIMESTAMP(6)   
//	B_COUNT      NOT NULL NUMBER         
//	M_ID                  VARCHAR2(20)   
//	BT_NO        NOT NULL NUMBER         
	
//	BT_NO   NOT NULL NUMBER       
//	BT_NAME NOT NULL VARCHAR2(50) 
	
//	F_NO        NOT NULL NUMBER        
//	F_DIRECTORY NOT NULL VARCHAR2(600) 
//	F_DATE      NOT NULL DATE          
//	B_NO        NOT NULL NUMBER  
	
//	C_NO         NOT NULL NUMBER        
//	B_NO         NOT NULL NUMBER        
//	M_ID         NOT NULL VARCHAR2(20)  
//	C_WRITER     NOT NULL VARCHAR2(60)  
//	C_WRITE_DATE NOT NULL TIMESTAMP(6)  
//	C_COMMNET    NOT NULL VARCHAR2(300) 
//	IS_MEMBER    NOT NULL VARCHAR2(2)   
	
	private int b_no;
	private String b_title;
	private String b_content;
	private String b_writer;
	private Timestamp b_write_date;
	private int b_count;
	private String m_id;
	
	private int bt_no;
	private String bt_name;
	
	private int f_no;
	private String f_original_filename;
	private String f_rename_filename;
	private Date f_date;
	private int f_count;
	
	private List<Map<String, String>> file_list;
	
	private int c_no;
	private String c_writer;
	private Timestamp c_write_date;
	private String c_comment;
	public int refnum;    //참조댓글번호
	public int c_level;  //댓글순위
	public int c_ref;
	public int c_seq;  //댓글 순서
	public int c_count;
	
	@Override
	public String toString() {
		return "Board [b_no=" + b_no + ", b_title=" + b_title + ", b_content=" + b_content + ", b_writer=" + b_writer
				+ ", b_write_date=" + b_write_date + ", b_count=" + b_count + ", m_id=" + m_id + ", bt_no=" + bt_no
				+ ", bt_name=" + bt_name + ", f_no=" + f_no + ", f_original_filename=" + f_original_filename
				+ ", f_rename_filename=" + f_rename_filename + ", f_date=" + f_date + ", f_count=" + f_count
				+ ", file_list=" + file_list + ", c_no=" + c_no + ", c_writer=" + c_writer + ", c_write_date="
				+ c_write_date + ", c_comment=" + c_comment + ", refnum=" + refnum + ", c_level=" + c_level + ", c_ref="
				+ c_ref + ", c_seq=" + c_seq + ", c_count=" + c_count + "]";
	}

	public Board() {
		super();
	}

	public int getB_no() {
		return b_no;
	}

	public void setB_no(int b_no) {
		this.b_no = b_no;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public String getB_content() {
		return b_content;
	}

	public void setB_content(String b_content) {
		this.b_content = b_content;
	}

	public String getB_writer() {
		return b_writer;
	}

	public void setB_writer(String b_writer) {
		this.b_writer = b_writer;
	}

	public Timestamp getB_write_date() {
		return b_write_date;
	}

	public void setB_write_date(Timestamp b_write_date) {
		this.b_write_date = b_write_date;
	}

	public int getB_count() {
		return b_count;
	}

	public void setB_count(int b_count) {
		this.b_count = b_count;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}


	public int getBt_no() {
		return bt_no;
	}

	public void setBt_no(int bt_no) {
		this.bt_no = bt_no;
	}

	public int getF_no() {
		return f_no;
	}

	public void setF_no(int f_no) {
		this.f_no = f_no;
	}

	public Date getF_date() {
		return f_date;
	}

	public void setF_date(Date f_date) {
		this.f_date = f_date;
	}

	public int getC_no() {
		return c_no;
	}

	public void setC_no(int c_no) {
		this.c_no = c_no;
	}

	public String getC_writer() {
		return c_writer;
	}

	public void setC_writer(String c_writer) {
		this.c_writer = c_writer;
	}

	public Timestamp getC_write_date() {
		return c_write_date;
	}

	public void setC_write_date(Timestamp c_write_date) {
		this.c_write_date = c_write_date;
	}

	public String getC_comment() {
		return c_comment;
	}

	public void setC_comment(String c_comment) {
		this.c_comment = c_comment;
	}

	public int getF_count() {
		return f_count;
	}

	public void setF_count(int f_count) {
		this.f_count = f_count;
	}

	public String getBt_name() {
		return bt_name;
	}

	public void setBt_name(String bt_name) {
		this.bt_name = bt_name;
	}

	public String getF_original_filename() {
		return f_original_filename;
	}

	public void setF_original_filename(String f_original_filename) {
		this.f_original_filename = f_original_filename;
	}

	public String getF_rename_filename() {
		return f_rename_filename;
	}

	public void setF_rename_filename(String f_rename_filename) {
		this.f_rename_filename = f_rename_filename;
	}

	public List<Map<String, String>> getFile_list() {
		return file_list;
	}

	public void setFile_list(List<Map<String, String>> file_list) {
		this.file_list = file_list;
	}

	public int getRefnum() {
		return refnum;
	}

	public void setRefnum(int refnum) {
		this.refnum = refnum;
	}

	public int getC_level() {
		return c_level;
	}

	public void setC_level(int c_level) {
		this.c_level = c_level;
	}

	public int getC_ref() {
		return c_ref;
	}

	public void setC_ref(int c_ref) {
		this.c_ref = c_ref;
	}

	public int getC_seq() {
		return c_seq;
	}

	public void setC_seq(int c_seq) {
		this.c_seq = c_seq;
	}

	public int getC_count() {
		return c_count;
	}

	public void setC_count(int c_count) {
		this.c_count = c_count;
	}
	
	
	
}
