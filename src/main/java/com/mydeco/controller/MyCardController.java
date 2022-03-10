package com.mydeco.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mydeco.service.MyCardService;

@RequestMapping("/card")
public class MyCardController {

	@Autowired 
	MyCardService mycardService;
	
	@RequestMapping("/list")
	public String list() {
		System.out.println("mycardcontroller-list");
		return "card/list";
	}
}
