package com.example.view.controller;

import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.project.board.BoardService;
import com.example.project.dto.BoardDTO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	 @Autowired private BoardService boardSerivce;
	
	@GetMapping(value = "/index")
	public String home(Model model) {
		
		List<BoardDTO> boardList = boardSerivce.getBoardList();
		model.addAttribute("getBoardList", boardList);
		
		return "index";
	}
	
}
