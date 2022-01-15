package com.springproject.biz.user.service;

import java.util.List;

import com.springproject.biz.user.jdbc.UserVO;

public interface UserService {
	// CRUD 기능의 메소드 구현
	
	// 글 등록
	void insertService(UserVO vo);
	
	// 글 목록 조회
	List<UserVO> getServiceList();
	
	// 글 상세 조회
	UserVO getService(String id);
	
	// 글 수정
	void updateService(UserVO vo);
	
	// 글 삭제
	void deleteService(String id);
}