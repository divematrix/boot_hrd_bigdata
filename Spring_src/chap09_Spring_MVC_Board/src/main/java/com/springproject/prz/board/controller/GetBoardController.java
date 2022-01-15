package com.springproject.prz.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.springproject.biz.board.jdbc.BoardVO;
import com.springproject.biz.board.service.BoardService;

public class GetBoardController implements Controller{
	@Autowired
	BoardService boardService;
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// System.out.println("글 상세 조회 처리.");
		
		String seq = request.getParameter("seq");
		
		BoardVO vo = boardService.getService(Integer.parseInt(seq));
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("board", vo);
		mav.setViewName("getBoard");
		return mav;
	}
}