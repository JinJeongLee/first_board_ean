package com.ean.first_board.board.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ean.first_board.board.domain.Board;
import com.ean.first_board.board.model.service.BoardService;
import com.ean.first_board.common.FileUpload;
import com.ean.first_board.member.domain.Member;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;





@Controller
//@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	@Autowired
	private FileUpload commonfile;
	
	@GetMapping("/")
	public ModelAndView viewBoard(ModelAndView mv
			, @RequestParam(name="list", required = false) List<Board> list
			, @RequestParam(name="page", required = false, defaultValue = "1") String page
			, @RequestParam(name="option", required = false, defaultValue = "0") int selectVal
			, @RequestParam(name="searchOpt", required = false, defaultValue = "title") String searchOpt
			, @RequestParam(name="searchVal", required = false) String searchVal
			, HttpSession session
			, RedirectAttributes rattr
			) {
				
		 if(session.getAttribute("loginSSInfo") == null) {
		 rattr.addFlashAttribute("msg", "로그인 후 이용 가능합니다.");
		 mv.setViewName("member/login"); //로그인으로 
		 return mv; 
		 }
				 
		int currentPage = 1; // 현재 페이지
		int contentLimit = 10; // 한 페이지에 보여질 정보 갯수
		
		String currentPageStr = page;
		try {
			if(currentPageStr != null && !currentPageStr.equals("")) {
				currentPage = Integer.parseInt(currentPageStr);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		int offset = (currentPage - 1) * contentLimit;
		RowBounds rowBounds = new RowBounds(offset, contentLimit);
		int listsize;
		
		if(searchVal != null) {
			list = service.selectBoardList(searchVal, searchOpt, selectVal, rowBounds);
			listsize = list.size()	;
		} else {
			listsize = service.countBoard()	;
			list = service.selectBoardList(selectVal, rowBounds);
			if(selectVal != 0) {
				listsize = list.size();
			}
		}
		int totalpageCnt = listsize/contentLimit + 1;
		int startPage = currentPage - (((currentPage % 5) == 0)?4:((currentPage % 5)-1)); 
		int endPage = ((startPage + 4) > totalpageCnt)?totalpageCnt:(startPage + 4);
		
		
		mv.addObject("option", selectVal);
		mv.addObject("boardList", list);
		mv.addObject("totalpageCnt", totalpageCnt);
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		mv.addObject("page", page);
		
		mv.setViewName("board/main");

		mv.addObject("searchOpt", searchOpt);
		mv.addObject("searchVal", searchVal);
		return mv;
	}
	
	
	@RequestMapping("/insert")
	public ModelAndView viewInsertBoard(ModelAndView mv
			, Board board
			, HttpSession session
			, RedirectAttributes rattr
			) {
		if(session.getAttribute("loginSSInfo") == null) {
			rattr.addFlashAttribute("msg", "로그인 후 이용 가능합니다.");
			mv.setViewName("member/login"); //로그인으로
			return mv;
		}
		mv.setViewName("board/insertBoard");
		return mv;
	}
	
	@PostMapping("/insert")
	public ModelAndView insertBoard(Board board
			, ModelAndView mv
			, HttpSession session
			, HttpServletRequest req
			, @RequestParam(name="b_title") String b_title
			, @RequestParam(name="b_content") String b_content
			, @RequestParam(name="bt_no") int bt_no
			, @RequestParam(name="uploadfile", required = false) List<MultipartFile> multiFile
			, RedirectAttributes rattr
			) {
		Member loginSSInfo = (Member)session.getAttribute("loginSSInfo");
		board.setB_title(b_title);
		board.setB_content(b_content);
		board.setBt_no(bt_no);
		board.setB_writer(loginSSInfo.getM_nickname());
		board.setM_id(loginSSInfo.getM_id());
		
		if(multiFile != null) {
			List<Map<String, String>> file_list = new ArrayList<Map<String, String>>();
			for(int i=0; i<multiFile.size(); i++) {
				String rename_filename = commonfile.saveFile(multiFile.get(i), req);
				Map<String, String> file_map = new HashMap<String, String>();
				file_map.put("f_original_filename", multiFile.get(i).getOriginalFilename());
				file_map.put("f_rename_filename", rename_filename);
				file_list.add(file_map);
			}
			board.setFile_list(file_list);
		}
		
		
		int result = service.insertBoard(board);
		if(result < 1) {
			rattr.addFlashAttribute("msg", "게시글 등록에 실패했습니다. 게시판으로 돌아갑니다.");
			mv.setViewName("redirect:/");
		} else { 
			rattr.addFlashAttribute("msg", "글 등록에 성공했습니다.");
			mv.setViewName("redirect:/");
			
		}
		return mv;
	}
	
	@GetMapping("/read")
	public ModelAndView selectBoard(ModelAndView mv
			, Board board
			, HttpSession session
			, RedirectAttributes rattr
			, @RequestParam(name="b_no") int b_no
			) {
		if(session.getAttribute("loginSSInfo") == null) {
			rattr.addFlashAttribute("msg", "로그인 후 이용 가능합니다.");
			mv.setViewName("redirect:member/login"); //로그인으로
			return mv;
		}
		service.updateCount(b_no);
		board.setB_no(b_no);
		mv.addObject("fileList", service.selectFile(b_no));
		mv.addObject("commentList", service.selectCommentList(b_no));
		mv.addObject("board", service.selectBoard(b_no));
		mv.setViewName("board/read");
		return mv;
	}
	
	@GetMapping("/update")
	public ModelAndView viewUpdateBoard(ModelAndView mv
			, Board board
			, HttpSession session
			, RedirectAttributes rattr
			, @RequestParam(name="b_no") int b_no
			) {
		if(session.getAttribute("loginSSInfo") == null) {
			rattr.addFlashAttribute("msg", "로그인 후 이용 가능합니다.");
			mv.setViewName("member/login"); //로그인으로
			return mv;
		}
		mv.addObject("b_no", b_no);
		mv.setViewName("board/update");
		return mv;
	}
	
	@PostMapping("/update")
	public ModelAndView updateBoard(
			HttpSession session
			, ModelAndView mv
			, RedirectAttributes rattr
			, Board board
			, @RequestParam(name="b_no") int b_no
			, @RequestParam(name="b_title") String b_title
			, @RequestParam(name="b_content") String b_content
			) {
		
		board.setB_no(b_no);
		board.setB_title(b_title);
		board.setB_content(b_content);
		
		int result = service.updateBoard(board);
		if(result == 1) {
			rattr.addFlashAttribute("msg", "글 수정에 성공했습니다.");
			mv.setViewName("redirect:/");
		} else { 
			rattr.addFlashAttribute("msg", "게시글 수정에 실패했습니다. 게시판으로 돌아갑니다.");
			mv.setViewName("redirect:/");
		}
		/*
		 * if(result == 1) { rattr.addFlashAttribute("msg", "게시글 수정이 완료되었습니다.");
		 * 
		 * } else { rattr.addFlashAttribute("msg", "게시글 수정에 실패했습니다."); }
		 */
		return mv;
		
		
	}
	
	@PostMapping("/delete")
	public ModelAndView deleteBoard(
			HttpSession session
			, ModelAndView mv
			, RedirectAttributes rattr
			, @RequestParam(name="b_no") int b_no
			) {
		
		int result = service.deleteBoard(b_no);
		if(result == 1) {
			rattr.addFlashAttribute("msg", "글 삭제를 성공했습니다.");
			mv.setViewName("redirect:/");
		} else { 
			rattr.addFlashAttribute("msg", "게시글 삭제를 실패했습니다. 게시판으로 돌아갑니다.");
			mv.setViewName("redirect:/");
		}
		return mv;
		
	}
	
	@PostMapping("/comment/insert")
	@ResponseBody
	public String insertComment(HttpSession session
			, Board board
			, RedirectAttributes rattr
			, @RequestParam(name="b_no") int b_no
			, @RequestParam(name="c_no", required = false, defaultValue = "0") int refnum
			, @RequestParam(name="c_comment") String c_comment
			) {
		if(session.getAttribute("loginSSInfo") == null) {
			rattr.addFlashAttribute("msg", "로그인 후 이용 가능합니다.");
			return "member/login";
		}
		Member loginSSInfo = (Member)session.getAttribute("loginSSInfo");
		board.setRefnum(refnum);
		board.setB_no(b_no);
		board.setM_id(loginSSInfo.getM_id());
		board.setC_writer(loginSSInfo.getM_nickname());
		board.setC_comment(c_comment);
		service.insertComment(board);
		List<Board> commentList = service.selectCommentList(b_no);
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
		return gson.toJson(commentList);
		
	}
	
	@PostMapping("/comment/delete")
	@ResponseBody
	public String deleteComment(HttpSession session
			, Board board
			, @RequestParam(name="c_no") int c_no
			, @RequestParam(name="b_no") int b_no
			) {
		service.deleteComment(c_no);
		List<Board> commentList = service.selectCommentList(b_no);
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
		return gson.toJson(commentList);
	}
	
	@PostMapping("/comment/update")
	@ResponseBody
	public String updateComment(HttpSession session
			, Board board
			, @RequestParam(name="b_no") int b_no
			, @RequestParam(name="c_no") int c_no
			, @RequestParam(name="c_comment") String c_comment
			) {
		board.setC_no(c_no);
		board.setC_comment(c_comment);
		service.updateComment(board);
		List<Board> commentList = service.selectCommentList(b_no);
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
		return gson.toJson(commentList);
	}
	
	
	/*
	 * @GetMapping("/list") public ModelAndView selectNotice(ModelAndView mv,
	 * 
	 * @RequestParam(name = "page", defaultValue = "1") int currentPage) {
	 * 
	 * final int pageSize = 7; // 한페이지에 보여줄 행 final int pageBlock = 3; // 페이징에 나타날
	 * 페이지수
	 * 
	 * 
	 * 
	 * List<Notice> noticelist = service.selectNotice(currentPage,pageSize);
	 * 
	 * mv.addObject("noticelist", noticelist); mv.setViewName("notice/list"); return
	 * mv; }
	 * 
	 * @GetMapping("/read") public ModelAndView readNotice( ModelAndView mv,
	 * 
	 * @RequestParam(name="no", defaultValue = "0") int nt_no ) { if(nt_no == 0) {
	 * mv.setViewName("redirect:list"); return mv; } Notice result =
	 * service.readNotice(nt_no);
	 * 
	 * int cnt = service.countNotice(nt_no);
	 * 
	 * mv.addObject("notice", result); mv.addObject("nt_cnt", cnt);
	 * mv.setViewName("notice/read");
	 * 
	 * return mv;
	 * 
	 * }
	 */

}
