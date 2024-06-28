package com.example.project.board;

import java.util.List;

import com.example.project.dto.BoardDTO;

public interface BoardService {

	List<BoardDTO> getBoardList();
	
	List<BoardDTO> getMyBoardList(String id);

	BoardDTO getBoardDetail(int boardNum);

	void insertBoard(BoardDTO board);
	
	void updateBoard(BoardDTO board);
	
	void deleteBoard(int boardNum);
	
}
