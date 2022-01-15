package com.springproject.prz.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.springproject.biz.board.jdbc.BoardVO;
import com.springproject.biz.board.service.BoardService;

public class GetBoardListController implements Controller{
	@Autowired
	BoardService boardService;
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// System.out.println("글 목록 검색 처리");
		
		List<BoardVO> list = boardService.getServiceList();
		
		// 검색 결과와 화면 정보를 ModelAndView에 저장하여 리턴한다.
		ModelAndView mav = new ModelAndView();
		mav.addObject("boardList", list);
		mav.setViewName("getBoardList");
		return mav;
	}
}