package com.springproject.prz.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.springproject.biz.user.jdbc.UserVO;
import com.springproject.biz.user.service.UserService;

@Controller
public class LogInOutController {
	@Autowired
	UserService userService;
	
	@RequestMapping(value = "login.me", method = RequestMethod.GET)
	public String loginForm() {
		// System.out.println("로그인 화면 처리...");
		return "login";
	}
	
	@RequestMapping(value = "login.me", method = RequestMethod.POST)
	// public String loginProc(UserVO vo) {
	public String loginProc(@ModelAttribute("usr") UserVO vo, HttpSession session) {
		//System.out.println("로그인 처리");

		if(vo.getId() == null || vo.getId().equals("")) {
			throw new IllegalArgumentException("아이디는 반드시 입력해야 합니다.");
		}
		
		UserVO user = userService.getService(vo.getId());
		
		String retVal = null;
		if((user != null) && (user.getPassword().equals(vo.getPassword()))) {
			session.setAttribute("userName", user.getName());
			retVal = "redirect:getBoardList.do";
		} else {
			retVal = "login";
		}
		
		return retVal; 
	}
	
	@RequestMapping("logout.me")
	public String logoutProc(HttpSession session) {
		// System.out.println("로그아웃 처리");
		session.invalidate();
		return "redirect:login.me";
	}
}