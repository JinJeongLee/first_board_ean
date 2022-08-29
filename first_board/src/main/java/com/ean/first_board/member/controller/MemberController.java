package com.ean.first_board.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ean.first_board.member.domain.Member;
import com.ean.first_board.member.model.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	
// 로그인 페이지 접속
	@GetMapping("/login")
	public ModelAndView viewLogin(ModelAndView mv) {
		mv.setViewName("member/login");
		return mv;
	}
// 로그인 기능
	@PostMapping("/login.do")
	public ModelAndView selectMember(
			ModelAndView mv
			, HttpSession session
			, HttpServletResponse response
			, RedirectAttributes rattr
			, @RequestParam(name="m_id") String m_id
			, @RequestParam(name="password") String password
			, Member member
			) {		
		member.setM_id(m_id);
		member.setPassword(password);
		Member result = service.selectMember(member);
		
		session.setAttribute("loginSSInfo", result);
		
		mv.setViewName("redirect:/");
		return mv;
	}

//로그아웃
	@GetMapping("/logout")
	public ModelAndView viewLogout(
			ModelAndView mv
			, HttpSession session
			, HttpServletRequest request
			, HttpServletResponse response) {
	
		request.getSession().invalidate(); // 세션 초기화 - 로그아웃에서만 사용 권장
		mv.setViewName("redirect:/");
		return mv;
	}
	
// 회원가입 페이지 접속
	@GetMapping("/join")
	public ModelAndView viewJoin(ModelAndView mv) {
		mv.setViewName("member/join");
		return mv;
	}
// 회원가입
	@PostMapping("/join")
	public ModelAndView insertMember(ModelAndView mv
			, @RequestParam(name="m_nickname") String m_nickname
			, @RequestParam(name="m_id") String m_id
			, @RequestParam(name="pwd") String password
			, Member member
			, RedirectAttributes rttr
			) {
		
		member.setM_id(m_id);
		member.setM_nickname(m_nickname);
		member.setPassword(password);
		
		int result = service.insertMember(member);
		if(result == 1) {
			rttr.addFlashAttribute("msg", "회원가입이 완료되었습니다.");
			mv.setViewName("redirect:/login");
		} else {
			rttr.addFlashAttribute("msg", "회원가입에 실패했습니다. 다시 시도해 주세요.");
			mv.setViewName("redirect:/join");
		}
		
		return mv;
	}

//중복체크
	@PostMapping("/nicknameChk")
	@ResponseBody
	public int checkNickname(
			@RequestParam(name="m_nickname") String m_nickname
			) {
		int result = service.checkNickname(m_nickname);
		return result;
	}
	@PostMapping("/idChk")
	@ResponseBody
	public int checkId(
			@RequestParam(name="m_id") String m_id
			) {
		int result = service.checkId(m_id);
		return result;
	}
	
}
