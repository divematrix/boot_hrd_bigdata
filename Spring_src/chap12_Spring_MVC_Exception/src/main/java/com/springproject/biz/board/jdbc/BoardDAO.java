package com.springproject.biz.board.jdbc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private final String INSERT = "insert into springboard(seq, title, writer, content) "
			+ "values((select nvl(max(seq), 0)+1 from springboard), ?, ?, ?)";
	private final String SELECT_LIST = "select * from springboard order by seq desc";
	private final String SELECT_LIST_TITLE = "select * from springboard where title like '%'||?||'%' order by seq desc";
	private final String SELECT_LIST_CONTENT = "select * from springboard where content like '%'||?||'%' order by seq desc";
	private final String SELECT_OBJECT = "select * from springboard where seq=?";
	private final String UPDATE = "update springboard set title=?, content=? where seq=?";
	private final String DELETE = "delete from springboard where seq=?";
	
	// 글 등록
	public void insert(BoardVO vo) {
		// System.out.println("=> JDBC로 insert() 호출");
		
		Object[] args = { vo.getTitle(), vo.getWriter(), vo.getContent() };
		jdbcTemplate.update(INSERT, args);
	}
	
	// 글 목록 조회
	public List<BoardVO> getList(BoardVO vo) {
		// System.out.println("=> JDBC로 getList() 호출");
		Object[] args = { vo.getSearchKeyword() };
		
		// 검색 기능 추가
		if(vo.getSearchCondition().equals("TITLE")) {
			return jdbcTemplate.query(SELECT_LIST_TITLE, args, new BoardRowMapper());
		} else if(vo.getSearchCondition().equals("CONTENT")) {
			return jdbcTemplate.query(SELECT_LIST_CONTENT, args, new BoardRowMapper());
		}
		return null;
	}
	
	// 글 상세 조회
	public BoardVO getObject(int seq) {
		// System.out.println("=> JDBC로 getObject() 호출");
		
		Object[] args = { seq };
		return jdbcTemplate.queryForObject(SELECT_OBJECT, args, new BoardRowMapper());
	}
	
	// 글 수정
	public void update(BoardVO vo) {
		// System.out.println("=> JDBC로 update() 호출");
		
		Object[] args = { vo.getTitle(), vo.getContent(), vo.getSeq() };
		jdbcTemplate.update(UPDATE, args);
	}
	
	// 글 삭제
	public void delete(int seq) {
		// System.out.println("=> JDBC로 delete() 호출");
		
		jdbcTemplate.update(DELETE, seq);
	}
}