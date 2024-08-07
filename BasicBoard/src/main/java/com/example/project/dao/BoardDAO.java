package com.example.project.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.project.dto.BoardDTO;

/* DAO(Data Access Object) : DB에 접근하는 객체, 데이터 접근로직을 비즈니스 로직으로부터 분리 */
@Repository
public class BoardDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 전체 게시글 목록조회
	public List<BoardDTO> getBoardList() {

		return mybatis.selectList("BoardDAO.getBoardList");
	}
	
	// 내 게시글 목록 조회
	public List<BoardDTO> getMyBoardList(String id){
		return mybatis.selectList("BoardDAO.getMyBoardList", id);
	}

	// 게시글 상세보기
	public BoardDTO getBoardDetail(int boardNum) {

		return mybatis.selectOne("BoardDAO.getBoardDetail", boardNum);
	}

	// 게시글 등록하기
	public void insertBoard(BoardDTO board) {

		mybatis.insert("BoardDAO.insertBoard", board);
	}
	
	// 게시글 수정
	public void updateBoard(BoardDTO board) {
		mybatis.update("BoardDAO.updateBoard", board);
	}
	
	// 게시글 삭제
	public void deleteBoard(int boardNum) {
		mybatis.delete("BoardDAO.deleteBoard", boardNum);
	}
}
