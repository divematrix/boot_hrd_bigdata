package com.springproject.prz.common;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice("com.springproject.prz")
public class CommonExceptionHandler {
	
	@ExceptionHandler(IllegalArgumentException.class) // 예외에 대한 핸들러 맵핑. ()괄호안에 자료형 명시
	public ModelAndView handleIllegalArgumentException(Exception e) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("exception", e);
		mav.setViewName("/common/arithmeticError");

		return mav;
	}
	
	@ExceptionHandler(NullPointerException.class)
	public ModelAndView handleNullPointerException(Exception e) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("exception", e);
		mav.setViewName("/common/nullPointerError");

		return mav;
	}
}