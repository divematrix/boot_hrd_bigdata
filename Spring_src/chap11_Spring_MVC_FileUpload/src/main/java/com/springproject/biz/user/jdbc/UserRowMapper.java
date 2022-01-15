package com.springproject.biz.user.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class UserRowMapper implements RowMapper<UserVO>{

	@Override
	public UserVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		UserVO user = new UserVO();
		
		user.setId(rs.getString("id"));
		user.setName(rs.getString("name"));
		user.setPassword(rs.getString("password"));
		user.setRole(rs.getString("role"));
		
		return user;
	}
}