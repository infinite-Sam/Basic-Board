package com.example.view.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.project.board.BoardService;
import com.example.project.dto.BoardDTO;
import com.example.project.dto.MemberDTO;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;

	// 전체 게시글 목록 조회
	@GetMapping(value="getBoardList")
	public String getBoardList(HttpSession session, Model model) {
		System.out.println("전체 게시글 목록 조회");
		List<BoardDTO> boardList = boardService.getBoardList();
		model.addAttribute("BoardList", boardList);

		return "board/boardList";
	}
	
	// 내 게시글 목록 조회
	@GetMapping(value="getMyBoardList")
	public String qnaList(HttpSession session, Model model) {
		System.out.println("내 게시글 목록 조회");
			MemberDTO loginMember = (MemberDTO)session.getAttribute("loginMember");
			List<BoardDTO> getMyBoardList = boardService.getMyBoardList(loginMember.getId());
			model.addAttribute("getMyBoardList", getMyBoardList);

			return "board/myBoardList";
	}

	// 게시글 상세보기
	@GetMapping(value="getBoardDetail")
	public String getBoardDetail(BoardDTO board, HttpSession session, Model model) {
		System.out.println("게시글 상세보기");
		BoardDTO getBoardNum = boardService.getBoard(board.getBoardNum());
		model.addAttribute("boardDTO", getBoardNum);
		return "board/boardDetail";
	}
}
