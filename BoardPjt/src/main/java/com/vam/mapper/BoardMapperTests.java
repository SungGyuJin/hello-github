package com.vam.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.vam.model.BoardVO;
import com.vam.model.Criteria;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {

	@Autowired
	private BoardMapper mapper;
	
//	@Test
//	public void testEnroll() {
//		
//		BoardVO vo = new BoardVO();
//		
//		vo.setTitle("mapper test");
//		vo.setContent("mapper test");
//		vo.setWriter("mapper test");
//		
//		mapper.enroll(vo);
//	}
	
//	@Test
//	public void testGetPage() {
//		
//		int bno = 2;
//		
//		log.info("" + mapper.getPage(bno));
//	}
	
//	@Test
//	public void testModify() {
//		
//		BoardVO board = new BoardVO();
//		board.setBno(1);
//		board.setTitle("수정");
//		board.setContent("수정테스트");
//		
//		int result = mapper.modify(board);
//		log.info("result : " + result);
//	}
	
	@Test
	public void testDelete() {
		
		int result = mapper.delete(21);
		log.info("result : " + result);
	}
	
	@Test
	public void testGetListPaging() {
		
		Criteria cri =  new Criteria();
		
		cri.setPageNum(2);
		
		List<?> list = mapper.getListPaging(cri);
		
		list.forEach(board -> log.info("" + board));
	}
}
