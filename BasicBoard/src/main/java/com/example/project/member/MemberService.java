package com.example.project.member;

import com.example.project.dto.MemberDTO;

public interface MemberService {

	public int loginID(MemberDTO member);
	
	MemberDTO getMember(String id);
	
	void insertMember(MemberDTO member);
	
}
