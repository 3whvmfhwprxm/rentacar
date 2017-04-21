package com.third.rent.event.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.third.rent.common.FileUploadWebUtil;
import com.third.rent.event.model.EventVO;

@Controller
@RequestMapping("/admin")
public class EventController {
	
	private static final Logger logger=LoggerFactory.getLogger(EventController.class);
	
	@Autowired
	private FileUploadWebUtil fileUtil;
	
	@RequestMapping(value="/evtNew.do", method=RequestMethod.GET)
	public String makeEvt_get(){
		//이벤트 등록 화면
		logger.info("관리 - 이벤트 등록 화면 보여주기");
		return "administrator/event/evtNew";
	}	
	
	//이벤트 등록 처리
	@RequestMapping(value="/evtNew.do", method=RequestMethod.POST)
	public String makeEvt_post(@ModelAttribute EventVO evo, HttpServletRequest request, Model model){
		//이벤트 등록 화면
		logger.info("관리 - 이벤트 등록 처리, 입력값 evo={}", evo);
		
		List<Map<String, Object>> imgList=fileUtil.fileUpload(request, FileUploadWebUtil.FILE_UPLOAD);
		
		String img1="", img2="";
		if(!imgList.isEmpty()){
			for(Map<String, Object> map : imgList){
				img1=(String)map.get("img1");
			}//for
		}//if
		
		evo.setEventImage1(img1);
		evo.setEventImage2(img2);
		
		
		return "administrator/event/evtList";
	}	
	
	//이벤트 목록 화면

	//이벤트 수정 화면
	
	//이벤트 수정 처리	
}
