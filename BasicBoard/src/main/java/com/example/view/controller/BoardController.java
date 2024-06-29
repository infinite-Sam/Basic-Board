package com.example.view.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.project.board.BoardService;
import com.example.project.dto.BoardDTO;
import com.example.project.dto.MemberDTO;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;

	// 게시글 작성 화면이동
	@GetMapping(value="boardWriteForm")
	public String boardWriteform(HttpSession session) {
		MemberDTO loginMember = (MemberDTO) session.getAttribute("loginMember");
		if (loginMember == null) {
			return "login";
		} else {
			return "board/boardWrite";	// 로그인이 되어있다면 게시글작성 화면이동
		}
	}
	
	// 게시글 작성기능
	@PostMapping(value="boardWriteAction")
	public String boardWriteAction(BoardDTO boardDTO, HttpSession session) {
			MemberDTO loginMember = (MemberDTO) session.getAttribute("loginMember");
			boardDTO.setId(loginMember.getId());
			boardService.insertBoard(boardDTO);
			// 오류가 뜬다면 이부분 확인
			return "redirect:getMyBoardList";
	}
	
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
	public String getMyBoardList(HttpSession session, Model model) {
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
		BoardDTO getBoardNum = boardService.getBoardDetail(board.getBoardNum());
		model.addAttribute("boardDTO", getBoardNum);
		return "board/boardDetail";
	}
	
	// 게시글 수정 화면
	@GetMapping(value="updateBoardForm")
	public String updateBoardForm(BoardDTO board, HttpSession session, Model model) {
		BoardDTO boardNum = boardService.getBoardDetail(board.getBoardNum());
		model.addAttribute("board", boardNum);
		return "board/updateBoard";
	}
	
	// 게시글 수정 기능
	@PostMapping(value="updateBoard")
	public String updateBoardAction(BoardDTO board, HttpSession session) {
		MemberDTO loginMember = (MemberDTO)session.getAttribute("loginMember");
			board.setId(loginMember.getId());
			boardService.updateBoard(board);
			return "redirect:boardDetail?boardNum="+board.getBoardNum(); // 작성완료후  공지사항 목록으로 이동
	}
	
	// 게시글 삭제 기능
	@RequestMapping(value = "deleteBoard")
	public String deleteBoard(BoardDTO board) {
		boardService.deleteBoard(board.getBoardNum());
		return "redirect:getMyBoardList";
	}
	
	
}
