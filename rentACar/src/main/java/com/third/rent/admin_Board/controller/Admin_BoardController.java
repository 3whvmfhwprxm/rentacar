package com.third.rent.admin_Board.controller;

import java.util.List;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.third.rent.admin_Board.model.Admin_BoardService;
import com.third.rent.common.PaginationInfo;
import com.third.rent.common.SearchVO;
import com.third.rent.common.Utility;
import com.third.rent.company.notice.model.CompanyNoticeVO;
import com.third.rent.company.notice.model.CompanyNoticeVOList;
import com.third.rent.company.notice.model.Company_noticeService;
import com.third.rent.service.notice.model.ServiceCenterNoticeVO;
import com.third.rent.user.notice.model.UserNoticeVO;

@Controller
@RequestMapping("/admin/Board")
public class Admin_BoardController {
	
	private static final Logger logger=LoggerFactory.getLogger(Admin_BoardController.class);
	
	@Autowired
	private Admin_BoardService adService;
	
	@Autowired
	private Company_noticeService comNoService;
	
	@RequestMapping("/uNotice.do")
	public String showUNotice(@ModelAttribute SearchVO searchVo, Model model){
		logger.info("관리자 시스템 - 고객 공지사항 관리 화면표시 searchVo={}", searchVo);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.ADMIN_PAYINFO_BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(Utility.ADMIN_PAYINFO_RECORDCOUNT_PERPAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		//SearchVO 값 셋팅
		searchVo.setRecordCountPerPage(Utility.ADMIN_PAYINFO_RECORDCOUNT_PERPAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<UserNoticeVO> unList=adService.selectUN(searchVo);
		logger.info("고객 공지사항 리스트 수, unList.size()={}", unList.size());
		
		int totalRecord=adService.selectTotalRecordU(searchVo);
		logger.info("고객 공지사항 전체수 조회 결과, totalRecord={}", totalRecord);
		
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("unList", unList);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "administrator/board_management/UNoticeBoardMng";
	}
	
	@RequestMapping("/scNotice.do")
	public String showSCNotice(@ModelAttribute SearchVO searchVo, Model model){		
		logger.info("관리자 시스템 - 상담센터 공지사항 관리 화면표시 searchVo={}", searchVo);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.ADMIN_PAYINFO_BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(Utility.ADMIN_PAYINFO_RECORDCOUNT_PERPAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		//SearchVO 값 셋팅
		searchVo.setRecordCountPerPage(Utility.ADMIN_PAYINFO_RECORDCOUNT_PERPAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<ServiceCenterNoticeVO> scnList=adService.selectSN(searchVo);
		logger.info("상담자센터 공지사항 리스트 수, scnList.size()={}", scnList.size());
		int totalRecord=adService.selectTotalRecordSC(searchVo);
		logger.info("고객 공지사항 전체수 조회 결과, totalRecord={}", totalRecord);
		
		pagingInfo.setTotalRecord(totalRecord);		
		
		model.addAttribute("scnList", scnList);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "administrator/board_management/SCNoticeBoardMng";
	}
	
	@RequestMapping("/cNotice.do")
	public String showCNotice(@ModelAttribute SearchVO searchVo, Model model){
		logger.info("관리자 시스템 - 업체 공지사항 관리 화면표시 searchVo={}", searchVo);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.ADMIN_PAYINFO_BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(Utility.ADMIN_PAYINFO_RECORDCOUNT_PERPAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		//SearchVO 값 셋팅
		searchVo.setRecordCountPerPage(Utility.ADMIN_PAYINFO_RECORDCOUNT_PERPAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<CompanyNoticeVO> cnList=adService.selectCN(searchVo);
		logger.info("업체 공지사항 리스트 수, cnList.size()={}", cnList.size());
		
		int totalRecord=adService.selectTotalRecordC(searchVo);
		logger.info("업체 공지사항 전체수 조회 결과, totalRecord={}", totalRecord);
		
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("cnList", cnList);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "administrator/board_management/CNoticeBoardMng";
	}
	
	@RequestMapping(value="/comNoticeEdit.do", method=RequestMethod.GET)
	public String comNoticeEdit_get(@RequestParam int cnoticeNo, Model model){

		logger.info("관리자 시스템 - 업체공지사항 상세보기, 파라미터 cnoticeNo={}", cnoticeNo);
		if(cnoticeNo==0){
			model.addAttribute("msg", "잘못된 url입니다");
			model.addAttribute("url", "/admin/Board/cNotice.do");	
			
			return "common/message";
		}
		
		CompanyNoticeVO cnvo = comNoService.selectByNo(cnoticeNo);
		logger.info("관리자 시스템 - 업체공지사항 조회결과 cnvo={}", cnvo);
		
		model.addAttribute("cnvo", cnvo);
		
		return "administrator/board_management/CNoticeBoard_edit";
	}
	
	@RequestMapping(value="/comNoticeEdit.do", method=RequestMethod.POST)
	public String comNoticeEdit_post(@ModelAttribute CompanyNoticeVO cvo, Model model){
		logger.info("관리자 시스템 - 업체 공지 사항 수정 파라미터 cvo={}", cvo);
		
		int result=comNoService.updateComNotice(cvo);
		logger.info("관리자 시스템 - 업체 공지 수정 결과 result={}", result);
		
		String url="/admin/Board/comNoticeEdit.do?cnoticeNo="+cvo.getCnoticeNo(), msg="";
		if(result>0){
			msg="해당 업체 공지가 수정되었습니다.";
		}else{
			msg="해당 업체 공지 수정 실패!";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping(value="/comNoticeInsert.do", method=RequestMethod.GET)
	public String comNoticeInsert_get(){
		logger.info("관리자 시스템 - 업체 공지 입력 화면 표시");
		
		return "administrator/board_management/CNoticeBoard_insert";
	}
	
	@RequestMapping(value="/comNoticeInsert.do", method=RequestMethod.POST)
	public String comNoticeInsert_post(@ModelAttribute CompanyNoticeVO cvo, HttpSession session, Model model){
		String adminid=(String)session.getAttribute("Admin_Id");
		
		logger.info("관리자 시스템 - 업체 공지 입력 처리 파라미터 cvo={}, adminid={}", cvo, adminid);
		cvo.setAdminId(adminid);
		
		int result=comNoService.insertComNotice(cvo);
		logger.info("관리자 시스템 - 업체 공지 입력 결과 result={}", result);
		
		String url="/admin/Board/comNoticeInsert.do", msg="";				
		if(result>0){
			url="/admin/Board/cNotice.do";
			msg="업체 공지가 성공적으로 입력되었습니다.";
		}else{
			msg="업체 공지 등록 시도중 실패하였습니다.";
		}
		
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		
		return "common/message";
	}
	
	@RequestMapping("/comNoticeDel.do")
	public String comNoticeUpdateDelFlag(@RequestParam int cnoticeNo, Model model){
		logger.info("관리자 시스템 - 업체 공지 삭제 업데이트 파라미터 값 cnoticeNo={}", cnoticeNo);
		
		int result=comNoService.updateComNoticeDelFlag(cnoticeNo);
		logger.info("관리자 시스템 - 업체 공지 삭제 업데이트 결과 result={}", result);
		
		String url="/admin/Board/cNotice.do", msg="";				
		if(result>0){			
			msg="업체 공지가 성공적으로 삭제처리되었습니다.";
		}else{
			url="/admin/Board/comNoticeEdit.do?cnoticeNo="+cnoticeNo;
			msg="업체 공지 삭제 시도중 실패하였습니다.";
		}
		
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		
		return "common/message";
	}
	
	@RequestMapping("/comNoticeVisibleMultiNo.do")
	public String comNoticeUpdateVisibleMultiNo(@ModelAttribute CompanyNoticeVOList cnvolist, Model model){
		logger.info("관리자 시스템 - 선택된 공지들 한번에 감추기 처리 cnvolist={}", cnvolist);
		
		List<CompanyNoticeVO> cnlist=cnvolist.getCvolist();
		
		int result=comNoService.updateComNoticeMultiVisibleNo(cnlist);
		logger.info("관리자 시스템 - 선택한 공지 목록 감추기 결과 result={}", result);
		
		String url="/admin/Board/cNotice.do", msg="";
		if(result!=-1){
			msg="선택한 공지 목록이 감추기 처리되었습니다.";
		}else{
			msg="선택한 공지 목록 감추기가 실패했습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/comNoticeVisibleYes")
	public String comNoticeUpdateVisibleYes(@RequestParam int cnoticeNo, Model model){
		logger.info("관리자 시스템 - 해당 업체 공지 보이기 처리 파라미터 cnoticeNo={}", cnoticeNo);
		
		int result=comNoService.updateComNoticeVisibleYes(cnoticeNo);
		logger.info("관리자 시스템 - 공지 보이기 처리 결과 result={}", result);
		
		String url="/admin/Board/cNotice.do", msg="";				
		if(result>0){			
			msg="해당 업체 공지가 보이기 처리되었습니다.";
		}else{
			url="/admin/Board/comNoticeEdit.do?cnoticeNo="+cnoticeNo;
			msg="해당 업체 공지 보이기 시도중 실패하였습니다.";
		}
		
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		
		return "common/message";
	}
	
	@RequestMapping("/comNoticeVisibleNo")
	public String comNoticeUpdateVisibleNo(@RequestParam int cnoticeNo, Model model){
		logger.info("관리자 시스템 - 해당 업체 공지 감추기 처리 파라미터 cnoticeNo={}", cnoticeNo);
		
		int result=comNoService.updateComNoticeVisibleNo(cnoticeNo);
		logger.info("관리자 시스템 - 공지 감추기 처리 결과 result={}", result);
		
		String url="/admin/Board/cNotice.do", msg="";				
		if(result>0){			
			msg="해당 업체 공지가 감추기 처리되었습니다.";
		}else{
			url="/admin/Board/comNoticeEdit.do?cnoticeNo="+cnoticeNo;
			msg="해당 업체 공지 감추기 시도중 실패하였습니다.";
		}
		
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		
		return "common/message";
	}
}
