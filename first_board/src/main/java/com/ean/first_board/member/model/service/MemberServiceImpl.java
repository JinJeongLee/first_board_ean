package com.ean.first_board.member.model.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ean.first_board.member.domain.Member;
import com.ean.first_board.member.model.dao.MemberDao;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao dao;
	
	
	//로그인
	@Override
	public Member selectMember(Member member) {
		return dao.selectMember(member);
	}
	
	//회원가입
	public int insertMember(Member member) {
		return dao.insertMember(member);
	}
	
	//중복체크
	@Override
	public int checkNickname(String m_nickname) {
		return dao.checkNickname(m_nickname);
	}
	@Override
	public int checkId(String m_id) {
		return dao.checkId(m_id);
	}
}
