package com.ean.first_board.board.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ean.first_board.board.domain.Board;
import com.ean.first_board.board.model.service.BoardService;


@Controller
//@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	@GetMapping("/")
	public ModelAndView viewBoard(ModelAndView mv
			, @RequestParam(name="list", required = false) List<Board> list
			, HttpSession session
			, RedirectAttributes rattr
			) {
		if(session.getAttribute("loginSSInfo") == null) {
			rattr.addFlashAttribute("msg", "로그인 후 이용 가능합니다.");
			mv.setViewName("member/login"); //로그인으로
			return mv;
		}
		list = service.selectBoardList();
		mv.addObject("boardList", list);
		mv.setViewName("board/main");
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
	@ResponseBody
	public int insertBoard(Board board
			, @RequestParam(name="b_title") String b_title
			, @RequestParam(name="b_content") String b_content
			, @RequestParam(name="bt_no") int bt_no
			, @RequestParam(name="b_writer") String b_writer
			, @RequestParam(name="m_id") String m_id
			) {
		board.setB_title(b_title);
		board.setB_content(b_content);
		board.setBt_no(bt_no);
		board.setB_writer(b_writer);
		board.setM_id(m_id);
		
		int result = service.insertBoard(board);
		return result;
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
			mv.setViewName("member/login"); //로그인으로
			return mv;
		}
		board.setB_no(b_no);
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
	public int updateBoard(
			HttpSession session
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
		/*
		 * if(result == 1) { rattr.addFlashAttribute("msg", "게시글 수정이 완료되었습니다.");
		 * 
		 * } else { rattr.addFlashAttribute("msg", "게시글 수정에 실패했습니다."); }
		 */
		return result;
		
	}
	
	@PostMapping("/delete")
	public int deleteBoard(
			HttpSession session
			, RedirectAttributes rattr
			, @RequestParam(name="b_no") int b_no
			) {
		
		int result = service.deleteBoard(b_no);
		return result;
		
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
