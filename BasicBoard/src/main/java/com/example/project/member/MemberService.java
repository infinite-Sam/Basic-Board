package com.example.project.member;

import com.example.project.dto.MemberDTO;

public interface MemberService {

	// 회원 로그인
	int loginAction(MemberDTO member);
	
	// 회원아이디 존재여부 확인
	int confirmID(String id);
	
	// 아이디 중복 검사
	public int idCheck(String memberId) throws Exception;
	
	// 회원 상세정보 조회
	MemberDTO getMember(String id);
	
	// 회원 가입
	void insertMember(MemberDTO member);
	
}
