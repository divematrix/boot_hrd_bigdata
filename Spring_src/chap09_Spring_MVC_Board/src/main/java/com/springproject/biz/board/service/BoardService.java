package com.springproject.biz.board.service;

import java.util.List;

import com.springproject.biz.board.jdbc.BoardVO;

// 서비스 클래스 객체를 주입할 인터페이스 설정
public interface BoardService {
	// CRUD 기능의 메소드 (미구현)
	
	// 글 등록
	void insertService(BoardVO vo);
	
	// 글 목록 조회
	List<BoardVO> getServiceList();
	
	// 글 상세 조회
	BoardVO getService(int seq);
	
	// 글 수정
	void updateService(BoardVO vo);
	
	// 글 삭제
	void deleteService(int seq);
}