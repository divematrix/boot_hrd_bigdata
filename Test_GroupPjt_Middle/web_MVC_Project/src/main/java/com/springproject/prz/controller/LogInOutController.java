package com.springproject.prz.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.springproject.biz.user.service.UserService;
import com.springproject.biz.user.vo.UserVO;

@Controller
public class LogInOutController {
	@Autowired
	UserService service;
	
	// 로그인 폼
	@GetMapping("login.do")
	public String logInForm() {
		return "user/login";
	}
	
	// 로그인 처리
	@PostMapping("login.do")
	public String logInProc(UserVO vo, HttpSession session) {
		String result = null;
		UserVO dbVO = null;
		
		if(vo.getId() == null || vo.getId().equals("")) {
			System.out.println("아이디를 반드시 입력해야 합니다");
		}else {
			dbVO = service.selectOne(vo);
		}
		
		if(vo.getPassword() != null && vo.getPassword().equals(dbVO.getPassword())) {
			session.setAttribute("id", vo.getId());
		} else {
			System.out.println("로그인 실패");
		}
		
		result = "redirect:index.jsp";
		return result;
	}
	
	// 로그아웃 처리
	@GetMapping("logout.do")
	public String logOutProc(HttpSession session) {
		session.invalidate();
		return "redirect:index.jsp";
	}
}
