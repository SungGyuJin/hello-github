package com.springpjt.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.springpjt.model.BoardVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardMapperTests {
	
	@Autowired
	private BoardMapper mapper;
	
//	@Test
//	public void listTests() {
//		
//		mapper.boardListPage();
//	}
	
//	@Test
//	public void regTests() {
//		
//		BoardVO bvo = new BoardVO();
//		
//		bvo.setTitle("제목");
//		bvo.setContent("내용");
//		bvo.setWriter("작성자");
//		
//		mapper.boardRegPage(bvo);
//	}
	
}
