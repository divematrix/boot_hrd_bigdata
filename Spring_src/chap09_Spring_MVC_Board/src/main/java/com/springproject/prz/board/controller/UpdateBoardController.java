package com.springproject.prz.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.springproject.biz.board.jdbc.BoardVO;
import com.springproject.biz.board.service.BoardService;

public class UpdateBoardController implements Controller{
	@Autowired
	BoardService boardService;
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// System.out.println("글 수정 처리");
		
		String seq = request.getParameter("seq");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		BoardVO vo = new BoardVO();
		vo.setSeq(Integer.parseInt(seq));
		vo.setTitle(title);
		vo.setContent(content);
		boardService.updateService(vo);
		
		vo = boardService.getService(Integer.parseInt(seq));
		ModelAndView mav = new ModelAndView();
		mav.addObject("board", vo);
		mav.setViewName("getBoard");
		return mav;
	}
}