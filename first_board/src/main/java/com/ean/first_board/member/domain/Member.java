package com.ean.first_board.member.domain;

import org.springframework.stereotype.Component;

@Component
public class Member {
	
	private String m_id;
	private String m_nickname;
	private String password;
	
	
	@Override
	public String toString() {
		return "Member [m_id=" + m_id + ", m_nickname=" + m_nickname + ", password=" + password + "]";
	}
	
	public Member() {
		super();
	}
	
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_nickname() {
		return m_nickname;
	}
	public void setM_nickname(String m_nickname) {
		this.m_nickname = m_nickname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	

}
