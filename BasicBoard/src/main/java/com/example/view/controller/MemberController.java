package com.example.view.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.example.project.dto.MemberDTO;
import com.example.project.member.MemberService;

@Controller
@SessionAttributes("loginMember")
public class MemberController {

	@Autowired
	private MemberService memberService;

	@GetMapping(value = "/login_form")
	public String loginForm() {
		return "login";
	}

	@PostMapping(value = "/login")
	public String loginAction(MemberDTO member, Model model) {
		MemberDTO loginUser = null;
		int result = memberService.loginID(member);

		if (result == 1) {
			loginUser = memberService.getMember(member.getId());
			model.addAttribute("loginUser", loginUser);

			return "redirect:/index";
		} else {
			return "login_fail";
		}
	}

	@GetMapping(value = "/join_form")
	public String joinView() {
		return "join";
	}

	@PostMapping(value = "/join")
	public String joinAction(MemberDTO member) {

		memberService.insertMember(member);

		return "login";
	}

	@GetMapping(value = "/logout")
	public String logout(SessionStatus status) {
		status.setComplete();

		return "login";
	}
}
