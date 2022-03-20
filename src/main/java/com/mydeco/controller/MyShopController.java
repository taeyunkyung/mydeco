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
import com.mydeco.vo.DiaryContentVo;
import com.mydeco.vo.ProductVo;
import com.mydeco.vo.ShoppingCmtVo2;
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

		UserVo authUser = (UserVo) session.getAttribute("authUser");
		List<DiaryContentVo> diaryList = myShopService.getDiaryList(authUser.getUserNo());
		model.addAttribute("diaryList", diaryList);

		return "myshop/seller-add";
	}
	
	@RequestMapping("/add")
	public String add(@ModelAttribute ProductVo productVo, @RequestParam("prodImgFile") MultipartFile[] file,
			@RequestParam("diaryNo[]") String[] diaryNoArr, HttpSession session) {

		UserVo authUser = (UserVo) session.getAttribute("authUser");
		productVo.setUserNo(authUser.getUserNo());
		myShopService.addProduct(productVo, file, diaryNoArr);

		return "redirect:/myshop/myProducts";
	}

	@RequestMapping("/addFormData")
	public String addFormData(@ModelAttribute ProductVo productVo, @RequestParam("formData") MultipartFile[] file,
			@RequestParam("diaryNo") String[] diaryNoArr, HttpSession session) {

		UserVo authUser = (UserVo) session.getAttribute("authUser");
		productVo.setUserNo(authUser.getUserNo());
		myShopService.addProduct(productVo, file, diaryNoArr);

		return "redirect:/myshop/myProducts";
	}

	@RequestMapping("/myProducts")
	public String myProductList(Model model,
			@RequestParam(value = "crtPage", required = false, defaultValue = "1") int crtPage,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword, HttpSession session) {

		UserVo authUser = (UserVo) session.getAttribute("authUser");
		Map<String, Object> map = myShopService.getMyProductpgList(authUser.getUserNo(), keyword, crtPage);
		model.addAttribute("map", map);

		return "myshop/seller-myList";
	}
	
	@RequestMapping("/updateForm")
	public String myProductsupdate(@RequestParam int prodNo, Model model, HttpSession session) {
		
		ProductVo productVo = myShopService.selectOneProd(prodNo);
		model.addAttribute("productVo", productVo);

		UserVo authUser = (UserVo) session.getAttribute("authUser");
		List<DiaryContentVo> diaryList = myShopService.getDiaryList(authUser.getUserNo());
		model.addAttribute("diaryList", diaryList);
		
		return "myshop/seller-update";
	}
	
	@RequestMapping("/update")
	public String update(@ModelAttribute ProductVo productVo, 
			@RequestParam("diaryNo[]") String[] diaryNoArr, HttpSession session) {
		
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		productVo.setUserNo(authUser.getUserNo());
		myShopService.updateInfo(productVo, diaryNoArr);
		
		return "redirect:/myshop/myProducts";
	}

	@ResponseBody
	@RequestMapping("/myProducts/remove")
	public String myProductsRemove(@RequestParam String delprodNo, HttpSession session) {
		System.out.println("remove.controller");
		UserVo authUser = (UserVo) session.getAttribute("authUser");

		ProductVo productVo = new ProductVo();
		productVo.setUserNo(authUser.getUserNo());
		productVo.setProdNo(Integer.parseInt(delprodNo));

		int count = myShopService.myProductRemove(productVo);
		String result = "fail";
		if (count > 0) {
			result = "success";
		}

		return result;
	}

	@RequestMapping("/pickedProducts")
	public String pick(Model model, @RequestParam(value = "crtPage", required = false, defaultValue = "1") int crtPage,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword, HttpSession session) {

		UserVo authUser = (UserVo) session.getAttribute("authUser");
		Map<String, Object> map = myShopService.getMyPickpgList(authUser.getUserNo(), keyword, crtPage);
		model.addAttribute("map", map);

		return "myshop/shop-likedList";
	}

	@ResponseBody
	@RequestMapping("/myPick/remove")
	public String myPickRemove(@RequestParam String delprodNo, HttpSession session) {
		System.out.println("remove.controller");
		UserVo authUser = (UserVo) session.getAttribute("authUser");

		ProductVo productVo = new ProductVo();
		productVo.setUserNo(authUser.getUserNo());
		productVo.setProdNo(Integer.parseInt(delprodNo));

		int count = myShopService.myPickRemove(productVo);
		String result = "fail";
		if (count > 0) {
			result = "success";
		}

		return result;
	}

	@RequestMapping("/chatList")
	public String chatList(Model model, HttpSession session) {

		UserVo authUser = (UserVo) session.getAttribute("authUser");
		Map<String, Object> map = myShopService.getChatList(authUser.getUserNo());
		model.addAttribute("map", map);

		return "myshop/shop-chatList";
	}

	@ResponseBody
	@RequestMapping("/chatList/chatDetails")
	public List<UserChatVo> chatDetails(@ModelAttribute UserChatVo userChatVo, HttpSession session) {
		System.out.println(userChatVo);

		UserVo authUser = (UserVo) session.getAttribute("authUser");
		userChatVo.setUserNo(authUser.getUserNo());
		List<UserChatVo> chatDetails = myShopService.getChatDetails(userChatVo);

		System.out.println(chatDetails);
		return chatDetails;
	}

	@ResponseBody
	@RequestMapping("/chat")
	public UserChatVo insertChat(@ModelAttribute UserChatVo userChatVo, HttpSession session) {
		System.out.println("chat.service");

		UserVo authUser = (UserVo) session.getAttribute("authUser");
		userChatVo.setUserNo(authUser.getUserNo());
		UserChatVo addReturn = myShopService.insertChat(userChatVo);

		return addReturn;
	}

	// 임시기능//
	@RequestMapping("/details")
	public String prodDetails(Model model, @RequestParam("prodNo") int prodNo) {

		ProductVo productVo = myShopService.selectOneProd(prodNo);
		model.addAttribute("productVo", productVo);
		
		List<ShoppingCmtVo2> commentList = myShopService.commentList(prodNo);
		model.addAttribute("commentList", commentList);
		return "myshop/shop-prodDetails";
	}
	
	@ResponseBody
	@RequestMapping("/viewdiary")
	public DiaryContentVo viewDiary(@RequestParam int diaryNo) {
		return myShopService.getOneDiary(diaryNo);
	}
	
	@ResponseBody
	@RequestMapping("/commentfirst")
	public ShoppingCmtVo2 commentfirst(@ModelAttribute ShoppingCmtVo2 shoppingCmtVo) {
		ShoppingCmtVo2 vo = myShopService.insertFirst(shoppingCmtVo);
		return vo;
	}
	
	@ResponseBody
	@RequestMapping("/reply")
	public ShoppingCmtVo2 reply(@ModelAttribute ShoppingCmtVo2 shoppingCmtVo) {
		ShoppingCmtVo2 vo = myShopService.insertReply(shoppingCmtVo);
		return vo;
	}
	
	@ResponseBody
	@RequestMapping("/checkpick")
	public String checkpick(@ModelAttribute ProductVo productVo) {
		ProductVo checkVo = myShopService.checkpick(productVo);
		String result = "empty";
		if(checkVo != null) {
			result = "exists";
		}
		return result;
	}

	@ResponseBody
	@RequestMapping("/addpick")
	public String addPick(@ModelAttribute ProductVo productVo) {
		int count = myShopService.addPick(productVo);
		String result = "fail";
		if (count > 0) {
			result = "success";
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/startchat")
	public UserChatVo startchat(@ModelAttribute UserChatVo userChatVo, HttpSession session) {
		
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		userChatVo.setUserNo(authUser.getUserNo());
		UserChatVo addReturn = myShopService.insertChat(userChatVo);
		return addReturn;
	}
}
