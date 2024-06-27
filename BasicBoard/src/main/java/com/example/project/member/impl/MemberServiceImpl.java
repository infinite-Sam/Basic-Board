package com.example.project.member.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.project.dao.MemberDAO;
import com.example.project.dto.MemberDTO;
import com.example.project.member.MemberService;

@Service("memberService")
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDAO memberDao;

	@Override
	public int loginAction(MemberDTO member) {
		return memberDao.loginAction(member);
	}
	
	@Override
	public int idCheck(String id) throws Exception {
		return memberDao.idCheck(id);
	}

	@Override
	public MemberDTO getMember(String id) {
		return memberDao.getMember(id);
	}

	@Override
	public void insertMember(MemberDTO member) {
		memberDao.insertMember(member);
	}

	@Override
	public int confirmID(String id) {
		return memberDao.confirmID(id);
	}
	
	
}
