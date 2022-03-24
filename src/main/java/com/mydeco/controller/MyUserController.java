package com.mydeco.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
		return "user/signup2";
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
	
	@ResponseBody
	@RequestMapping("/idCheck")
	public boolean idCheck(@RequestParam("keyword") String keyword) {
		return myUserService.idCheck(keyword);
	}

	@RequestMapping("/modifyForm")
	public String modifyForm(HttpSession session, Model model) {
		
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		UserVo userVo = myUserService.modifyForm(authUser.getUserNo());
		model.addAttribute("userVo", userVo);
		
		return "user/modifyForm2";
	}
	
	@RequestMapping("/modify")
	public String modify(@ModelAttribute UserVo userVo, HttpSession session) {
		System.out.println(userVo);
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		userVo.setUserNo(authUser.getUserNo());
		myUserService.modify(userVo);
		
		return "redirect:/my/modifyForm";
	}

	@RequestMapping("/leave")
	public String leave() {
		return "user/user-leave";
	}
}
