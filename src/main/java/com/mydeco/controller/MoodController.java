package com.mydeco.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mood")
public class MoodController {

	
	@RequestMapping("/test")
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
