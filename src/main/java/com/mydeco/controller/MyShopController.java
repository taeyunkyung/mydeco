package com.mydeco.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.mydeco.service.MyShopService;
import com.mydeco.vo.DiaryVo2;
import com.mydeco.vo.ProductVo;
import com.mydeco.vo.UserVo;

@Controller
@RequestMapping("/myshop")
public class MyShopController {

	@Autowired
	private MyShopService myShopService;
	
	@RequestMapping("/beSeller")
	public String be() {
		return "myshop/seller-be";
	}
	
	@RequestMapping("/addProduct")
	public String addForm(HttpSession session, Model model) {
		
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		List<DiaryVo2> diaryList = myShopService.getDiaryList(authUser.getUserNo());
		model.addAttribute("diaryList", diaryList);
		
		return "myshop/seller-add";
	}	
	
	@RequestMapping("/add")
	public String add(@ModelAttribute ProductVo productVo, 
			@RequestParam("prodImgFile") MultipartFile[] file,
			@RequestParam("diaryNo[]") String[] diaryNoArr,
			HttpSession session) {
		
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		productVo.setUserNo(authUser.getUserNo());
		myShopService.addProduct(productVo, file, diaryNoArr);
		
		return "redirect:/myshop/myProducts";
	}
	
	@RequestMapping("/myProducts")
	public String my() {
		return "myshop/seller-myList";
	}
	
	@RequestMapping("/pickedProducts")
	public String pick() {
		return "myshop/shop-likedList";
	}
	
	@RequestMapping("/chatList")
	public String chatList() {
		return "myshop/shop-chatList";
	}
} 
