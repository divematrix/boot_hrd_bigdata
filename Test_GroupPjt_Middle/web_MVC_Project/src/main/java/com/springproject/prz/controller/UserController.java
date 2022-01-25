package com.springproject.prz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.springproject.biz.file.service.FileService;
import com.springproject.biz.user.service.UserService;
import com.springproject.biz.user.vo.UserVO;

@Controller
public class UserController {
	@Autowired
	UserService service;
	
	@Autowired
	FileService fileService;
	
	// 유저 가입 폼
	@GetMapping("/insertUser.do")
	public String insertUserForm() {
		System.out.println("CTRL:insertUserForm");
		return "user/insertUser";
	}
	
	// 유저 가입 처리
	@PostMapping("/insertUser.do")
	public String insertUserProc(UserVO vo) {
		System.out.println("CTRL:insertUserProc");
		String result = "redirect:index.jsp";
		return result;
	}
	
	// 유저 목록 조회
	@GetMapping("/getUserList.do")
	public String getUserList() {
		System.out.println("CTRL:getUserList");
		String result = "user/getUserList";
		return result;
	}
	
	// 유저 정보 조회
	@GetMapping("/getUser.do")
	public String getUser() {
		System.out.println("CTRL:getUser");
		String result = "user/getUser";
		return result;
	}
	
	// 유저 정보 수정 폼
	@GetMapping("/updateUser.do")
	public String updateUserForm() {
		System.out.println("CTRL:updateUserForm");
		String result = "user/updateUser";
		return result;
	}
	
	// 유저 정보 수정 처리
	@PostMapping("/updateUser.do")
	public String updateUserProc() {
		System.out.println("CTRL:updateUserProc");
		String result = "redirect:index.jsp";
		return result;
	}
	
	// 유저 암호 수정
	@PostMapping("/updateUserPw.do")
	public String updateUserPw() {
		System.out.println("CTRL:updateUserPw");
		String result = "user/updateUserPw";
		return result;
	}
	
	// 유저 탈퇴
	@GetMapping("/deleteUser.do")
	public String deleteUser() {
		System.out.println("CTRL:deleteUser");
		String result = "redirect:index.jsp";
		return result;
	}
}
