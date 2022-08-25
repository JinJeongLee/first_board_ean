package com.ean.first_board.member.model.service;


import com.ean.first_board.member.domain.Member;


public interface MemberService {
	
	//로그인
	public Member selectMember(Member member);
}
