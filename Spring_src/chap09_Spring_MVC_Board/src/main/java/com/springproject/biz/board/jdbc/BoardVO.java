package com.springproject.biz.board.jdbc;

import java.sql.Date;

public class BoardVO {

	// table 속성에 맞춰 멤버 변수 설정

	private int seq;
	private String title;
	private String writer;
	private String content;
	private Date regdate;
	private int cnt;

	// 멤버 변수에 맞는 get, set 메소드 생성

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	@Override
	public String toString() {
		return "BoardVO[seq="+seq+", title="+title
				+", writer="+writer+", content="+content
				+", regdate="+regdate+", cnt="+cnt+"]";
	}
}