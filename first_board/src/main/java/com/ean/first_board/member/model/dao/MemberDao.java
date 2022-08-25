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
		
}
