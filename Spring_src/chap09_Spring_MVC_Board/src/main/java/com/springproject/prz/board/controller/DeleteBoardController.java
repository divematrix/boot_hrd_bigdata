package com.springproject.prz.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.springproject.biz.board.service.BoardService;

public class DeleteBoardController implements Controller{
	@Autowired
	BoardService boardService;
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		boardService.deleteService(Integer.parseInt(request.getParameter("seq")));
		mav.setViewName("redirect:getBoardList.do");
		return mav;
	}
}