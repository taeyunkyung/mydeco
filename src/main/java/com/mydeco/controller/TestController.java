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
	
	
	@RequestMapping("/query")
	public void query() {
		
	    for(int i=100; i<126; i++) {
	    	String stickerName = i + ".png";
	    	String stickerSrc = "/mydeco/assets/img/diarypaper/"+stickerName;
	    	String insert = "Insert into STICKER (STICKERNO,STICKERCATENO,STICKERNAME,STICKERSRC) values (";
	    
	    	System.out.println(insert+i+" ,"+"1 ,'"+stickerName+"','"+stickerSrc+"');");

	    }	
	}
	
	
	
}
