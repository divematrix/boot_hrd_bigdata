package com.springproject.biz.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springproject.biz.board.jdbc.BoardDAO;
import com.springproject.biz.board.jdbc.BoardVO;

@Service
public class BoardServiceImp implements BoardService{

	// DB와 서비스할 DAO 클래스는 @Repository로 설정

	@Autowired // 서비스될 객체가 주입될 대상
	BoardDAO boardDAO;
	
	@Override
	public void insertService(BoardVO vo) {
		boardDAO.insert(vo);
	}

	@Override
	public List<BoardVO> getServiceList() {
		return boardDAO.getList();
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