package com.springproject.biz.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springproject.biz.user.dao.UserDAO;
import com.springproject.biz.user.vo.UserVO;

@Service
public class UserServiceImp implements UserService{
	@Autowired
	private UserDAO dao;
	
	@Override
	public void insert(UserVO vo) {
		dao.insert(vo);
	}

	@Override
	public List<UserVO> selectList(UserVO vo) {
		return dao.selectList(vo);
	}

	@Override
	public UserVO selectOne(UserVO vo) {
		return dao.selectOne(vo);
	}

	@Override
	public void update(UserVO vo) {
		dao.update(vo);
	}

	@Override
	public void updatePw(UserVO vo) {
		dao.updatePw(vo);
	}

	@Override
	public void delete(UserVO vo) {
		dao.delete(vo);
	}
}
