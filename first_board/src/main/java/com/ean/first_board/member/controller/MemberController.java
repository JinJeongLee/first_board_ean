package com.ean.first_board.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	public ModelAndView viewlogin(ModelAndView mv) {
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
}
