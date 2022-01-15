package com.springproject.biz.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springproject.biz.board.jdbc.BoardDAO;
import com.springproject.biz.board.jdbc.BoardVO;

@Service
public class BoardServiceImp implements BoardService{

	@Autowired
	BoardDAO boardDAO;
	
	@Override
	public void insertService(BoardVO vo) {
		boardDAO.insert(vo);
	}

	@Override
	public List<BoardVO> getServiceList(BoardVO vo) {
		return boardDAO.getList(vo);
	}

	@Override
	public BoardVO getService(int seq) {
		return boardDAO.getObject(seq);
	}

	@Override
	public void updateService(BoardVO vo) {
		boardDAO.update(vo);
	}

	@Override
	public void deleteService(int seq) {
		boardDAO.delete(seq);
	}
}