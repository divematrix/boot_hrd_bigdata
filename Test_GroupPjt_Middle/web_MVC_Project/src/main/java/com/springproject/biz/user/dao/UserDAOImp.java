package com.springproject.biz.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springproject.biz.user.vo.UserVO;

@Service
public class UserDAOImp implements UserDAO{
	@Autowired
	private SqlSessionTemplate sql;
	
	@Override
	public void insert(UserVO vo) {
		// sql.insert("UserDAO.insert", vo);
	}

	@Override
	public List<UserVO> selectList(UserVO vo) {
		// return sql.selectList("UserDAO.selectList", vo);
		return null;
	}

	@Override
	public UserVO selectOne(UserVO vo) {
		// return sql.selectOne("UserDAO.selectOne", vo);
		return null;
	}

	@Override
	public void update(UserVO vo) {
		// sql.update("UserDAO.update", vo);
	}

	@Override
	public void updatePw(UserVO vo) {
		// sql.update("UserDAO.updatePw", vo);
	}

	@Override
	public void delete(UserVO vo) {
		// sql.delete("UserDAO.delete", vo);
	}
}
