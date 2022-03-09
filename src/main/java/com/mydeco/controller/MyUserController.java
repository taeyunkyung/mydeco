package com.mydeco.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mydeco.service.MyUserService;
import com.mydeco.vo.UserVo;

@Controller
@RequestMapping("/my")
public class MyUserController {

	@Autowired
	private MyUserService myUserService;

	@RequestMapping("/signup")
	public String signup() {
		System.out.println("signup.page");
		return "user/signup";
	}

	@ResponseBody
	@RequestMapping("/sign")
	public String sign(@ModelAttribute UserVo userVo) {
		int count = myUserService.signup(userVo);
		String result = "fail";
		if (count > 0) {
			result = "success";
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/login")
	public String login(@ModelAttribute UserVo userVo, HttpSession session) {
		UserVo authUser = myUserService.login(userVo);
		String result = "fail";
		
		if(authUser != null) {
			session.setAttribute("authUser", authUser);
			System.out.println(authUser);
			result = "success"; 
			return result;
		} else {
			System.out.println("로그인실패");
			return result;
		}
	}

	@RequestMapping("/pwcheck")
	public String pwcheck() {
		return "user/user-pwcheck";
	}
	
	@ResponseBody
	@RequestMapping("/pwchkResult")
	public String pwchkResult(HttpSession session) {
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		String targetPw = authUser.getPassword();
		return targetPw;
	}

	@RequestMapping("/modifyForm")
	public String modifyForm(HttpSession session, Model model) {
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		authUser.getUserNo();
		
		return "user/modifyForm";
	}

	@RequestMapping("/leave")
	public String leave() {
		return "user/user-leave";
	}
}
