package com.springproject.biz.user.jdbc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private final String INSERT = "insert into users(id, password, name, role) values(?,?,?,?)";
	private final String SELECT_LIST = "select * from users order by id desc";
	private final String SELECT_OBJECT = "select * from users where id=?";
	private final String UPDATE = "update users set password=?, name=? where id=?";
	private final String DELETE = "delete from users where id=?";
	
	// 유저 등록
	public void insert(UserVO vo) {
		Object[] args = { vo.getId(), vo.getPassword(), vo.getName(), vo.getRole() };
		jdbcTemplate.update(INSERT, args);
	}
	
	// 유저 목록 조회
	public List<UserVO> getList(){
		return jdbcTemplate.query(SELECT_LIST, new UserRowMapper());
	}
	
	// 유저 상세 조회
	public UserVO getObject(String id) {
		Object[] args = { id };
		return jdbcTemplate.queryForObject(SELECT_OBJECT, args , new UserRowMapper());
	}
	
	// 유저 수정
	public void update(UserVO vo) {
		Object[] args = { vo.getPassword(), vo.getName(), vo.getRole() };
		jdbcTemplate.update(UPDATE, args);
	}
	
	// 유저 삭제
	public void delete(String id) {
		jdbcTemplate.update(DELETE, id);
	}
}