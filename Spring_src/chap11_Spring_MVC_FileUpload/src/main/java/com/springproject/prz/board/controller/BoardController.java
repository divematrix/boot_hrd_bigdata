package com.springproject.prz.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.springproject.biz.board.jdbc.BoardVO;
import com.springproject.biz.board.service.BoardService;

@Controller
public class BoardController {
	@Autowired
	BoardService boardService;
	
	// 글 등록
	@RequestMapping(value = "/insertBoard.do", method = RequestMethod.GET)
	public String insertBoard() {
		// System.out.println("글 등록 처리");
		return "insertBoard";
	}
	
	// 메소드 실행후 insertBoard.jsp로 접속할경우 반환값 필요없다
	// 메소드 실행후 insertBoard가 아닌 페이지로 접속할 경우 반환값 필요
	// 가시성을 위해서 반환값을 설정한다
	
	// 글 등록 처리
	@RequestMapping(value = "/insertBoard.do", method = RequestMethod.POST)
	public String insertBoardProc(BoardVO vo, HttpSession session) throws IOException {
		// System.out.println("글 등록 화면 처리..");
		
		// 파일 업로드 처리
		String fileSaveFolder = session.getServletContext().getRealPath("/boardUpload/");
		//System.out.println("=> " + fileSaveFolder);
		
		MultipartFile uploadFile = vo.getUploadFile();
		
		if(!uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename();
			uploadFile.transferTo(new File(fileSaveFolder+fileName));
		}
		
		boardService.insertService(vo);
		return "redirect:getBoardList.do";
	}
	
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap(){
		Map<String, String> conditionMap = new HashMap<String, String>();
		
		conditionMap.put("제목", "TITLE");
		conditionMap.put("내용", "CONTENT");
		
		return conditionMap;
	}
	
	// 글 목록 검색 처리
	@RequestMapping("/getBoardList.do")
	public String getBoardList(Model model, BoardVO vo){
		// System.out.println("글 목록 검색 처리");
		
		// 검색 기능 추가
		if(vo.getSearchCondition() == null) {
			vo.setSearchCondition("TITLE");
		}
		if(vo.getSearchKeyword() == null) {
			vo.setSearchKeyword("");
		}
		
		List<BoardVO> list = boardService.getServiceList(vo);
		model.addAttribute("boardList", list);
		
		return "getBoardList";
	}
	
	// 글 상세 보기
	@RequestMapping("/getBoard.do")
	public String getBoard(BoardVO vo, Model model) {
		// System.out.println("글 상세 조회 처리");
		
		BoardVO board = boardService.getService(vo.getSeq());
		model.addAttribute("board", board);
		
		return "getBoard";
	}
	
	// 글 수정
	@RequestMapping(value = "/updateBoard.do", method = RequestMethod.POST)
	public String updateBoard(BoardVO vo) {
		// System.out.println("글 수정 처리.");
		boardService.updateService(vo);
		return "redirect:getBoardList.do";
	}
	
	// 글 삭제
	@RequestMapping("/deleteBoard.do")
	public String deleteBoard(BoardVO vo) {
		// System.out.println("게시글 삭제 처리.");
		boardService.deleteService(vo.getSeq());
		return "redirect:getBoardList.do";
	}
}