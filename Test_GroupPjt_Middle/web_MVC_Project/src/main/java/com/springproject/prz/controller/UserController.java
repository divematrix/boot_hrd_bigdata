package com.springproject.prz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.springproject.biz.file.service.FileService;
import com.springproject.biz.user.service.UserService;
import com.springproject.biz.user.vo.UserVO;

public class UserController {
	@Autowired
	UserService service;
	
	@Autowired
	FileService fileService;
	
	// 유저 가입 폼
	@GetMapping("insertUser.do")
	public String insertUserForm() {
		return "user/insertUser";
	}
	
	// 유저 가입 처리
	@PostMapping("insertUser.do")
	public String insertUserProc(UserVO vo) {
		String result = "redirect:index.jsp";
		return result;
	}
	
	// 유저 목록 조회
	@GetMapping("getUserList.do")
	public String getUserList() {
		String result = "redirect:index.jsp";
		return result;
	}
	
	// 유저 정보 조회
	@GetMapping("getUser.do")
	public String getUser() {
		String result = "redirect:index.jsp";
		return result;
	}
	
	// 유저 정보 수정
	@GetMapping("updateUser.do")
	public String updateUser() {
		String result = "redirect:index.jsp";
		return result;
	}
	
	// 유저 암호 수정
	@GetMapping("updateUserPw.do")
	public String updateUserPw() {
		String result = "redirect:index.jsp";
		return result;
	}
	
	// 유저 탈퇴
	@GetMapping("deleteUser.do")
	public String deleteUser() {
		String result = "redirect:index.jsp";
		return result;
	}
}
