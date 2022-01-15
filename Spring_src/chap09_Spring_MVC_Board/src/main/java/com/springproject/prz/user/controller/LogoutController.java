package com.springproject.prz.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

// Controller 인터페이스 상속해 구현해야 한다
public class LogoutController implements Controller{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// System.out.println("로그아웃 처리.");
		
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession();
		session.invalidate();
		
		mav.setViewName("redirect:index.jsp");
		return mav;
	}
}