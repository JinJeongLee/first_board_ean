package com.ean.first_board.member.model.dao;



import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ean.first_board.member.domain.Member;



@Repository
public class MemberDao {
	
	@Autowired
	private SqlSession sqlsession;
	 
	// 로그인
	public Member selectMember(Member member) {
		return sqlsession.selectOne("Member.selectMember", member);
	}
	
	//회원가입
	public int insertMember(Member member) {
		return sqlsession.insert("Member.insertMember", member);
	}
	
	//닉네임, 아이디 중복체크
	public int checkNickname(String m_nickname) {
		return sqlsession.selectOne("Member.checkNickname", m_nickname);
	}
	public int checkId(String m_id) {
		return sqlsession.selectOne("Member.checkId", m_id);
	}
		
}
