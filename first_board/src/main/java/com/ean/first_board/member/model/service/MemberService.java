package com.ean.first_board.member.model.service;


import com.ean.first_board.member.domain.Member;


public interface MemberService {
	
	//로그인
	public Member selectMember(Member member);
	
	//회원가입
	public int insertMember(Member member);
	
	//닉넴, 아이디 중복체크
	public int checkNickname(String m_nickname);
	public int checkId(String m_id);
}
