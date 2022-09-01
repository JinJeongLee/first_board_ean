package com.ean.first_board.common;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileUpload {

	public String saveFile(MultipartFile file, HttpServletRequest request) {
		String rename_filename = null;
		long timeForRename = System.currentTimeMillis();
		
		String realPath = request.getSession().getServletContext().getRealPath("");
		// C:\z_workspace\z_spring\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\myboard_project\
		String savePath = "resources\\uploadFiles";
		File folder = new File(realPath+savePath);
		if(!folder.exists()) {
			folder.mkdirs();
		}
		System.out.println("folder:"+folder);
		String filePath = realPath+savePath+"\\"+ timeForRename +"_"+file.getOriginalFilename();
		System.out.println(filePath);
		try {
			file.transferTo(new File(filePath));// 파일 저장
			
			// 성공
			rename_filename = "/resources/uploadFiles/"+ timeForRename +"_"+file.getOriginalFilename();
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}   
		
		return rename_filename;
	}
	
	
	public void removeFile(String board_file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles";

		System.out.println("board_file before:"+board_file);
		board_file = board_file.substring(board_file.lastIndexOf("/")+1);
		System.out.println("board_file after :"+board_file);
		
		String filePath = savePath + "\\" + board_file;
		try {
			System.out.println("기존 저장 경로 : " + filePath);
			File delFile = new File(filePath);
			delFile.delete(); 	// 파일 삭제
			System.out.println("파일 삭제가 완료되었습니다.");
		} catch (Exception e) {
			System.out.println("파일 삭제 에러 : " + e.getMessage());
		}
	}
}
