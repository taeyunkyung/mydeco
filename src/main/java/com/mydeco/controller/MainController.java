package com.mydeco.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	
	@RequestMapping("/main")
	public String letter() {
		System.out.println("main");
		
		return "main/main";
	}
	
}
