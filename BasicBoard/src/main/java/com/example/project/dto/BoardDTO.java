package com.example.project.dto;

import java.security.Timestamp;

/* DTO(Data Transfer Object) : 데이터 전달 객체
 * 계층간 데이터 교환 목적, DB테이블의 행을 자바 객체로 표현할때 주용 사용,
 * getter와 setter 메소드만을 가진 단순 자바 객체 */
public class BoardDTO {

	private int boardNum;
	private String title;
	private String content;
	private String id;
	private String indate;

	public int getBoardNum() {
		return boardNum;
	}

	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getIndate() {
		return indate;
	}

	public void setIndate(String indate) {
		this.indate = indate;
	}

	@Override
	public String toString() {
		return "BoardDTO [boardNum=" + boardNum + ", title=" + title + ", content=" + content + ", id=" + id
				+ ", indate=" + indate + "]";
	}

}
