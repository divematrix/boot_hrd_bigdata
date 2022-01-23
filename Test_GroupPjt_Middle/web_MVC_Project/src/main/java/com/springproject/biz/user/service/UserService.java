package com.springproject.biz.user.service;

import java.util.List;

import com.springproject.biz.user.vo.UserVO;

public interface UserService {
	public void insert(UserVO vo);
	public List<UserVO> selectList(UserVO vo);
	public UserVO selectOne(UserVO vo);
	public void update(UserVO vo);
	public void updatePw(UserVO vo);
	public void delete(UserVO vo);
}
