package com.springproject.biz.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springproject.biz.user.jdbc.UserDAO;
import com.springproject.biz.user.jdbc.UserVO;

@Service
public class UserServiceImp implements UserService{
	@Autowired
	UserDAO userDAO;
	
	@Override
	public void insertService(UserVO vo) {
		userDAO.insert(vo);
	}

	@Override
	public List<UserVO> getServiceList() {
		return userDAO.getList();
	}

	@Override
	public UserVO getService(String id) {
		return userDAO.getObject(id);
	}

	@Override
	public void updateService(UserVO vo) {
		userDAO.update(vo);
	}

	@Override
	public void deleteService(String id) {
		userDAO.delete(id);
	}
}