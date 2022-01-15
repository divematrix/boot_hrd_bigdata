package com.springproject.prz.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.springproject.biz.user.jdbc.UserVO;
import com.springproject.biz.user.service.UserService;

public class LoginController implements Controller{
	@Autowired
	private UserService userService;

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// System.out.println("로그인 처리");
		
		// 1. 사용자 입력 정보 추출
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		// 2. Service 처리
		UserVO user = userService.getService(id);
		
		// 3. 화면 처리
		ModelAndView mav = new ModelAndView();
		
		if((user != null) && (user.getPassword().equals(password))) {
			mav.setViewName("redirect:getBoardList.do");
		}else {
			mav.setViewName("redirect:login.jsp");
		}
		
		return mav;
	}
}