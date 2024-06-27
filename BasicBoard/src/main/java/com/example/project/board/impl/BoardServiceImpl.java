package com.example.project.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.project.board.BoardService;
import com.example.project.dao.BoardDAO;
import com.example.project.dto.BoardDTO;

@Service("boardService")
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDAO boardDao;

	@Override
	public List<BoardDTO> getBoardList() {
		return boardDao.getBoardList();
	}
	
	@Override
	public List<BoardDTO> getMyBoardList(String id) {
		return boardDao.getMyBoardList(id);
	}

	@Override
	public BoardDTO getBoard(int boardNum) {
		return boardDao.getBoard(boardNum);
	}

	@Override
	public void insertBoard(BoardDTO board) {
		boardDao.insertBoard(board);
	}

	@Override
	public void updateBoard(BoardDTO board) {
		boardDao.updateBoard(board);
	}

	@Override
	public void deleteBoard(int boardNum) {
		boardDao.deleteBoard(boardNum);
	}
}
