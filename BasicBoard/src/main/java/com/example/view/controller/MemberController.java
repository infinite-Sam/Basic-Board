package com.example.view.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.example.project.dto.MemberDTO;
import com.example.project.member.MemberService;

@Controller
@SessionAttributes("loginMember")
public class MemberController {

	@Autowired
	private MemberService memberService;

	// 로그인 화면 표시
	@GetMapping(value = "/login_form")
	public String loginForm() {
		System.out.println("로그인 화면 이동");
		return "login";
	}

	// 로그인 기능
	@PostMapping(value = "/login")
	public String loginAction(MemberDTO member, Model model) {

		System.out.println("로그인 시작");

		MemberDTO loginMember = null;

		int result = memberService.loginAction(member);

		if (result == 1) { // 사용자 인증 성공
			loginMember = memberService.getMember(member.getId());
			model.addAttribute("loginMember", loginMember);
			System.out.println("로그인성공");
			return "redirect:index"; // 이전 페이지로 리다이렉트
		} else {
			System.out.println("로그인 실패");
			return "login_fail";
		}
	}

	// 회원가입 화면 이동
	@GetMapping(value = "/signUp_form")
	public String signUpForm() {
		System.out.println("회원가입화면 이동");
		return "signUp";
	}

	// 아이디 중복 검사
	@PostMapping(value = "/idChk")
	@ResponseBody
	public String idChk(String id) throws Exception{
		int result = memberService.idCheck(id);
		if(result != 0) {
			return "fail"; // 아이디 중복
		} else {
			return "success";
		}
	}
	
	// 회원가입
	@PostMapping(value = "/signUp")
	public String signUpAction(MemberDTO member) {

		memberService.insertMember(member);

		return "login";
	}

	@GetMapping(value = "/logout")
	public String logout(SessionStatus status) {
		System.out.println("로그아웃");
		status.setComplete(); // 현재 세션 종료

		return "login";
	}
}
