package com.mydeco.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mydeco.service.MydiaryService;
import com.mydeco.vo.DiaryContentVo;
import com.mydeco.vo.StickerVo;
import com.mydeco.vo.UserVo;

@Controller
@RequestMapping("/diary")
public class MydiaryController {
	
	@Autowired 
	MydiaryService mydiaryService;
	
	@RequestMapping("/list")
	public String list(Model model, HttpSession Session) {
		System.out.println("mydiarycontroller-list");
		UserVo authUser = (UserVo)Session.getAttribute("authUser");
		
		/*로그인 사용자일때*/
		if(authUser!= null) {
			/*일기 리스트*/
			List<DiaryContentVo> diarycontentList = mydiaryService.getDiaryContentList(authUser);
			model.addAttribute("diarycontentList", diarycontentList);
			System.out.println("=============================");
			System.out.println(diarycontentList);
			
			/*일기쓴 날짜리스트*/
			List<DiaryContentVo> day = mydiaryService.getDiaryDateList(authUser);
			model.addAttribute("dayList", day);
			return "diary/list";
		}else {
			/*비로그인 사용자*/
			return "diary/list-notLogin";
		}
		
	}
	
	/*일기 쓴 날짜 리스트*/
	
	@ResponseBody
	@RequestMapping("/datelist")
	public List<DiaryContentVo> dateList(HttpSession Session) {
		
		UserVo authUser = (UserVo)Session.getAttribute("authUser");
		System.out.println(authUser.getUserNo());
		List<DiaryContentVo> day = mydiaryService.getDiaryDateList(authUser);
		
		/*
		List<DiaryContentVo> diaryDayList = new ArrayList<DiaryContentVo>();
		for(int i=0; i<day.size(); i++) {
			String diaryDate = day.get(i).getDiaryDate();//diaryDate 하나의 값
			DiaryContentVo wday = new DiaryContentVo(diaryDate);//diaryDate값으로 vo만들기
			diaryDayList.add(wday);
			//return wday;
		}*/
		
		System.out.println("=============================");
		//System.out.println(diaryDayList);
		System.out.println("=============================");
		
		return day;
		
	}
	

	@RequestMapping("/writeForm")
	public String writeForm(Model model) {
		System.out.println("mydiarycontroller-writeForm");
		
		//db에 있는 이미지경로 이용해서 스티커들 갖고와야함.
		List<StickerVo> stickerList = mydiaryService.getStickerList();
		model.addAttribute("stickerList",stickerList);
		
		//db의 종이 갖고오기
		/*
		List<PaperVo> paperList = mydiaryService.getPaperList();
		model.addAttribute("paperList",paperList);
		System.out.println(paperList);*/
		
		return "diary/writeForm";
	}
	
	@ResponseBody
	@RequestMapping("/write")
	public int write(@RequestBody DiaryContentVo diarycontentvo) {
		System.out.println("mydiarycontroller-write");
		System.out.println(diarycontentvo);
		
		return mydiaryService.addContent(diarycontentvo);
		
		
		/*
		try {
			return "success";
		} catch (Exception e) {
			System.out.println(e);
			return "fail";
		}*/
	}
	

	@ResponseBody
	@RequestMapping("/read")
	public DiaryContentVo read(@RequestBody DiaryContentVo diarycontentvo) {
		
		System.out.println(diarycontentvo);
		/*ajax - 목록에서 클릭한 일기의 번호*/
		int diaryNo = diarycontentvo.getDiaryNo();
		
		return mydiaryService.getOneDiary(diaryNo);
		
	}

	
	
	/*db에 스티커 이미지 경로,이름 저장하기*/
	@RequestMapping("/dbsticker")
	public String dbsticker() {
		System.out.println("dbs");
			
		mydiaryService.dbsticker();
		return "";
	}
	
	/*db에 종이 이미지 경로,이름 저장하기*/
	/*
	@RequestMapping("/dbpaper")
	public String dbpaper() {
		System.out.println("dbp");
			
		mydiaryService.dbpaper();
		return "";
	}*/
}



