package com.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.mapper.BoardMapper;

@Controller
@RequestMapping(value = "/")
public class MainController {
	
	@Autowired
	private BoardMapper mapper;
	
	@RequestMapping("/")
	public String homePage(Model model) {
		
		model.addAttribute("key", "반갑습니다");
		
		return "home";
	}
	
	@RequestMapping("test/viewPage")
	public String viewJsp(Model model) {
		
		model.addAttribute("hi", "ㅎㅇ");
		
		return "test/viewPage";
	}
	
}
