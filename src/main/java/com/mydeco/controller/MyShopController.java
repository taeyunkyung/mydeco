package com.mydeco.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mydeco.service.MyShopService;
import com.mydeco.vo.DiaryVo2;
import com.mydeco.vo.ProductVo;
import com.mydeco.vo.UserChatVo;
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
	public String myProductList(Model model, 
			@RequestParam(value="crtPage", required=false, defaultValue="1") int crtPage,
			@RequestParam(value="keyword", required=false, defaultValue="") String keyword,
			HttpSession session) {
		
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		Map<String, Object> map = myShopService.getMyProductpgList(authUser.getUserNo(), keyword, crtPage);
		model.addAttribute("map", map);
		
		return "myshop/seller-myList";
	}
	
	@ResponseBody
	@RequestMapping("/myProducts/remove")
	public String myProductsRemove(@RequestParam String delprodNo, HttpSession session) {
		System.out.println("remove.controller");
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		
		ProductVo productVo = new ProductVo();
		productVo.setUserNo(authUser.getUserNo());
		productVo.setProdNo(Integer.parseInt(delprodNo));
		
		int count = myShopService.myProductRemove(productVo);
		String result = "fail";
		if(count>0) {
			result = "success";
		}
		
		return result;
	}
	
	@RequestMapping("/pickedProducts")
	public String pick(Model model, 
			@RequestParam(value="crtPage", required=false, defaultValue="1") int crtPage,
			@RequestParam(value="keyword", required=false, defaultValue="") String keyword,
			HttpSession session) {
		
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		Map<String, Object> map = myShopService.getMyPickpgList(authUser.getUserNo(), keyword, crtPage);
		model.addAttribute("map", map);
		
		return "myshop/shop-likedList";
	}
	
	@ResponseBody
	@RequestMapping("/myPick/remove")
	public String myPickRemove(@RequestParam String delprodNo, HttpSession session) {
		System.out.println("remove.controller");
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		
		ProductVo productVo = new ProductVo();
		productVo.setUserNo(authUser.getUserNo());
		productVo.setProdNo(Integer.parseInt(delprodNo));
		
		int count = myShopService.myPickRemove(productVo);
		String result = "fail";
		if(count>0) {
			result = "success";
		}
		
		return result;
	}
	
	@RequestMapping("/chatList")
	public String chatList(Model model, HttpSession session) {
		
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		Map<String, Object> map = myShopService.getChatList(authUser.getUserNo());
		model.addAttribute("map", map);
		
		return "myshop/shop-chatList";
	}
	
	/*@RequestMapping("/chatList/chatDetails")
	public void chatDetails(@RequestParam("prodNo") int prodNo, HttpSession session) {
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		UserChatVo userChatVo = new UserChatVo();
		userChatVo.setUserNo(authUser.getUserNo());
		userChatVo.setProdNo(prodNo);
	}*/
} 
