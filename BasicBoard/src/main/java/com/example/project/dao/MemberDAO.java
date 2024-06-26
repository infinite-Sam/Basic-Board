package com.example.project.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.project.dto.MemberDTO;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertMember(MemberDTO member) {
		mybatis.insert("MemberDAO.insertMember", member);
	}
	
	public MemberDTO getMember(String id) {
		return mybatis.selectOne("MemberDAO.getMember", id);
	}
	
	public int loginID(MemberDTO member) {
		int result = -1;
		String pwd = null;
		
		pwd = mybatis.selectOne("MemberDAO.confirmID", member.getId());
		
		if (pwd == null) {
			result = -1;
		} else if (pwd.equals(member.getPassword())) {
			result = 1;
		} else {
			result = 0;
		}
		return result;	
	}
	
}
