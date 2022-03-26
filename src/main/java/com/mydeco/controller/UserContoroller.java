package com.mydeco.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mydeco.service.UserService;
import com.mydeco.vo.UserVo;

@Controller
public class UserContoroller {

	
	
	
	
	
	
	
	@Autowired
	private UserService userService;
	
	//로그인
	@RequestMapping("/loginForm")
	public String mainlogin() {
		System.out.println("메인로그인 도킹");
		
		return "shopping/loginForm";
	}
	
	
	
	
	@RequestMapping("/login")
	public String login(@ModelAttribute UserVo userVo, HttpSession session) {
		System.out.println("로그인");
		System.out.println(userVo);
		System.out.println(session);
		
		UserVo authUser = userService.login(userVo);
		
		if(authUser != null) {
			//로그인성공시 //세션에 저장
			System.out.println("로그인성공");
			session.setAttribute("authUser", authUser);
			
			return "redirect:main";
		}else {
			return "redirect:loginForm?result=fail";
		}
	}
	
	
	
	//로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session){
		System.out.println("로그아웃 집에가라 이제");
		
		session.removeAttribute("authUser");
		session.invalidate();
		
		return "redirect:loginForm";
	}
	
	
	
	
}
