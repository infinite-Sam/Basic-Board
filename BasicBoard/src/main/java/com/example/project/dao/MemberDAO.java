package com.example.project.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.project.dto.MemberDTO;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 회원 상세정보
	public MemberDTO getMember(String id) {
		System.out.println("회원 상세정보 조회");
		return mybatis.selectOne("MemberDAO.getMember", id);
	}
	
	// 회원 가입
	public void insertMember(MemberDTO member) {
		System.out.println("회원 추가");
		mybatis.insert("MemberDAO.insertMember", member);
	}
	
	// 아이디 중복 검사
	public int idCheck(String id) {
		return mybatis.selectOne("MemberDAO.idCheck", id);
	};
	
	// 회원 ID 존재 여부확인
	public int confirmID(String id) {
		
		System.out.println("회원 ID 인증");
		String pwd = mybatis.selectOne("MemberDAO.confirmID", id);
		
		if(pwd!=null) {
			return 1;
		} else {
			return -1;
		}
	}
	
	// 회원로그인
	public int loginAction(MemberDTO member) {
		
		System.out.println("회원 로그인");
		
		int result = -1; // 기본 -1
		String password = null; // 입력한 비밀번호
		
		// 아이디를 조건으로 비밀번호를 가져옴
		password = mybatis.selectOne("MemberDAO.confirmID", member.getId());

		// DB에서 조회한 pwd와 사용자가 입력한 pwd 비교
		if(password == null) { // 비밀번호를 입력하지 않았을때
			result = -1;
			System.out.println("아이디또는 비밀번호를 입력해 주세요.");
		} else if(password.equals(member.getPassword())) { // PWD가 일치하는 경우
			result = 1;
			System.out.println("로그인 성공");
		} else { // 비밀번호가 일치하지 않는 경우
			result = 0;
			System.out.println("로그인 실패");
		}
		return result;
	}
}
