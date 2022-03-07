package com.mydeco.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/diary")
public class MydiaryController {

	@RequestMapping("/writeForm")
	public String writeForm() {
		System.out.println("mydiarycontroller-writeForm");
		return "diary/writeForm";
	}
}
