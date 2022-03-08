package com.mydeco.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mydeco.vo.PaperItemVo;
import com.mydeco.vo.StickerVo;

@Controller
public class FaController {

	@RequestMapping("/faWriteForm")
	public String faWriteForm(Model model) {
		System.out.println("faWriteForm");
		
		//��ƼĿ������ ��񿡼� ������
		List<StickerVo> stickerList = new ArrayList<StickerVo>();
		
		for(int i=0; i<12; i++) {
			String stickerName = i +".jpg"; 
			String stickerPath = "/mydeco/assets/sticker/"+stickerName;
			
			StickerVo vo = new StickerVo(1, i, stickerPath, stickerName);
			stickerList.add(vo);
		}
	
		System.out.println(stickerList);
		
		model.addAttribute("stickerList", stickerList);
		
		return "fa/writeForm";
	}
	
	
	
	@RequestMapping("/faWrite")
	public String faWrite(@RequestBody List<PaperItemVo> paperItemList) {
		System.out.println("faWrite");
		System.out.println(paperItemList.size());
		System.out.println(paperItemList);
		
		return "";
	}
	
	
	@RequestMapping("/faRead")
	public String faRead() {
		System.out.println("faRead");
		
		return "fa/read";
	}
	
	
	@ResponseBody
	@RequestMapping("/faGetItemList")
	public List<PaperItemVo> faGetItemList() {
		System.out.println("faGetItemList");
		
		//��񿡼� �о��
		List<PaperItemVo> paperItemList = new ArrayList<PaperItemVo>();
		
		PaperItemVo item00 = new PaperItemVo(0, 308, 191, 0.25, 0.25, 0, 0, "/mydeco/assets/sticker/0.jpg", ""); 
		PaperItemVo item01 = new PaperItemVo(1, 106, 195, 1.05, 0.25, 0, 7, "/mydeco/assets/sticker/7.jpg", ""); 
		PaperItemVo item02 = new PaperItemVo(3, 283.3820705568176, 615.4022326065749, 0.5026315789473684, 0.5026315789473684, 51.76193503428479, 5, "/mydeco/assets/sticker/5.jpg", ""); 
		PaperItemVo item03 = new PaperItemVo(4, 493.43897998570475, 125.85232960286106, 0.09061961183571426, 0.09061961183571426, 313.247745504104, 10, "/mydeco/assets/sticker/10.jpg", ""); 
		
		PaperItemVo item04 = new PaperItemVo(5, 30.0, 30.0, 1.0, 1.0, 0.0, 9999999, "", "\n�ؽ�Ʈ\n��������\n������"); 
		
		paperItemList.add(item00);
		paperItemList.add(item01);
		paperItemList.add(item02);
		paperItemList.add(item03);
		
		paperItemList.add(item04);
		
		return paperItemList;
	}
}
