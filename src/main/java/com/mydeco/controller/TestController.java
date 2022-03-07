package com.mydeco.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mydeco.service.TestService;

@Controller
public class TestController {

	@Autowired
	private TestService testService;
	
	@RequestMapping("/test")
	public String test() {
		System.out.println("test");
		testService.tests();
		return "user/modifyForm";
	}
	
	@RequestMapping("/main")
	public String main() {
		System.out.println("main");
		return "main/main";
	}
	
	@RequestMapping("/mtest")
	public String mtest() {
		System.out.println("mood test");
		return "mood/test";
	}
	
	@RequestMapping("/daily")
	public String daily() {
		System.out.println("daily");
		return "mood/daily";
	}
}
