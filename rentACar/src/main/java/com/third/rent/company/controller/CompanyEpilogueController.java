package com.third.rent.company.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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

import com.third.rent.Comments.model.CommentsService;
import com.third.rent.Comments.model.CommentsVO;
import com.third.rent.admin_Board.model.Admin_BoardService;
import com.third.rent.common.DateSearchVO2;
import com.third.rent.common.FileUploadWebUtil;
import com.third.rent.common.PaginationInfo;
import com.third.rent.common.SearchVO;
import com.third.rent.common.Utility;
import com.third.rent.company.model.CompanyService;
import com.third.rent.company.model.CompanyVO;
import com.third.rent.company.notice.model.CompanyNoticeVO;
import com.third.rent.company.notice.model.Company_noticeService;


@Controller
@RequestMapping("/com_manage")
public class CompanyEpilogueController {

	private static final Logger logger=LoggerFactory.getLogger(CompanyEpilogueController.class);
	
	@Autowired
	private FileUploadWebUtil fileUploadWebUtil;
	
	@Autowired
	private Admin_BoardService adService;
	
	@Autowired
	private CompanyService comService;
	
	@Autowired
	private Company_noticeService comNoService;
	
	@Autowired
	private CommentsService commentService;
	
	@RequestMapping("/company_epilogue.do")
	public String company_epilogue(@ModelAttribute SearchVO searchVo, Model model,
			HttpSession session){
		String comId = (String)session.getAttribute("comId");
		searchVo.setcomId(comId);
		logger.info("업체 후기 화면표시 searchVo={}", searchVo);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.COM_BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(Utility.COM_RECORDCOUNT_PERPAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		//SearchVO 값 셋팅
		searchVo.setRecordCountPerPage(Utility.COM_RECORDCOUNT_PERPAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<CommentsVO> cList=comService.selectAll(searchVo);
		logger.info("업체 이용후기 리스트 수, cList.size()={}", cList.size());
		
		int totalRecord=comService.selectTotalRecord(searchVo);
		logger.info("업체 이용후기 전체수 조회 결과, totalRecord={}", totalRecord);
		
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("cList", cList);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "com_manage/company_epilogue";
	}
	@RequestMapping(value="/company_epilogue_detail.do",method=RequestMethod.GET)
	public String epilogue_detail_get(@RequestParam int cmtNo, Model model){
		//1.
		logger.info("업체공지사항 상세보기, 파라미터 cmtNo={}", cmtNo);
		if(cmtNo==0){
			model.addAttribute("msg", "잘못된 url입니다");
			model.addAttribute("url", "/com_manage/company_epilogue.do");	
			
			return "common/message";
		}
		CommentsVO vo = commentService.selectByCmtNo(cmtNo);
			logger.info("업체공지사항 조회결과 companyVo={}", vo);
		
		model.addAttribute("commentsVo", vo);
		
		return "com_manage/company_epilogue_detail";
	}
	
	
	
	
	@RequestMapping("/company_announcement.do")
	public String companyAnnouncement(@ModelAttribute SearchVO searchVo, Model model){
		logger.info("업체 공지사항 화면표시 searchVo={}", searchVo);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.COM_BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(Utility.COM_RECORDCOUNT_PERPAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		//SearchVO 값 셋팅
		searchVo.setRecordCountPerPage(Utility.COM_RECORDCOUNT_PERPAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<CompanyNoticeVO> cnList=adService.selectCN(searchVo);
		logger.info("업체 공지사항 리스트 수, cnList.size()={}", cnList.size());
		
		int totalRecord=adService.selectTotalRecordC(searchVo);
		logger.info("업체 공지사항 전체수 조회 결과, totalRecord={}", totalRecord);
		
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("cnList", cnList);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "com_manage/company_announcement";
	}
	
	@RequestMapping("/countUpdate.do")
	public String countUpdate(
			@RequestParam(value="cnoticeNo", defaultValue="0") int cnoticeNo,
			Model model){
		//1.
		logger.info("조회수 증가 처리, 파라미터 no={}", cnoticeNo);
		if(cnoticeNo==0){
			model.addAttribute("msg", "잘못된 url입니다");
			model.addAttribute("url", "/com_manage/company_announcement.do");

			return "common/message";
		}

		//2.
		int cnt = comService.updateReadCount(cnoticeNo);
		logger.info("조회수 증가 결과, cnt={}", cnt);

		//3.
		return "redirect:/com_manage/company_announcement_detail.do?cnoticeNo="+cnoticeNo;
	}
	
	@RequestMapping(value="/company_announcement_detail.do",method=RequestMethod.GET)
	public String detail_announcement_get(@RequestParam int cnoticeNo, Model model){
		//1.
		logger.info("업체공지사항 상세보기, 파라미터 cnoticeNo={}", cnoticeNo);
		if(cnoticeNo==0){
			model.addAttribute("msg", "잘못된 url입니다");
			model.addAttribute("url", "/com_manage/company_announcement.do");	
			
			return "common/message";
		}
		CompanyNoticeVO vo = comNoService.selectByNo(cnoticeNo);
			logger.info("업체공지사항 조회결과 companyVo={}", vo);
		
		model.addAttribute("CompanyNoticeVo", vo);
		
		return "com_manage/company_announcement_detail";
	}
	
	
	@RequestMapping(value="/company_detail.do",method=RequestMethod.GET)
	public String companyEdit_get(@RequestParam String comId,
			Model model){
		
		//String comId = null;
		logger.info("업체화면 보여주기, 파라미터 comId={}", comId);
		
		if(comId==null || comId.isEmpty()){
			model.addAttribute("msg", "잘못된 url입니다");
			model.addAttribute("url", "com_manage/company_detail");
			
			return "common/message";
		}
		
		CompanyVO companyVo
			= comService.selectBycomId(comId);
		logger.info("업체화면 조회결과 companyVo={}", companyVo);
		
		model.addAttribute("companyVo", companyVo);
		
		return "com_manage/company_detail";
	}
	
	@RequestMapping(value="/company_detail.do", method=RequestMethod.POST)
	public String companyEdit_post(HttpServletRequest reuest,
			@ModelAttribute CompanyVO companyVo,
			Model model) throws IOException {
		logger.info("업체 수정 처리, 파라미터 companyVo={}", companyVo);
		
		FileUploadWebUtil fileUpload = new FileUploadWebUtil();
		List<Map<String, Object>> map = fileUpload.fileUpload(reuest, 2);
		
		
		companyVo.setComLogo(map.get(0).get("fileName").toString());
/*		map.get(0).get("fileSize");
		map.get(0).get("originalFileName");*/
		
		int cnt = comService.updateCompany(companyVo);
		logger.info("업체 수정 결과 cnt={}", cnt);
		
		String msg = "", url = "";
		if(cnt>0){
			msg = "업체 수정 성공";
			url = "/com_manage/company_detail.do?comId="+companyVo.getComId();
		}else{
			msg = "업체 수정 실패";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "common/message";
	}

	@RequestMapping("/company_revenueMonth.do") 
	public String revenueMonth(@ModelAttribute DateSearchVO2 dvo, HttpSession session, Model model){
		String companyId = (String)session.getAttribute("comId");
		logger.info("매출 통계 화면 구현, 파라미터 comId={}", companyId);
		dvo.setCompanyId(companyId);
		logger.info("####################################파라미터 year={}", dvo.getYear());
		
		List<Map<String, Object>> slist=null;
		List<String> listPay = new ArrayList<String>();
		List<String> listMonth = new ArrayList<String>();
		if(dvo.getYear()!=null && !dvo.getYear().isEmpty()){
			slist=comService.ComselectSalesByMonth(dvo);
			logger.info("월별 매출 조회 결과는 slist.size()={}", slist.size());
			
			for(int i = 0 ; i < slist.size() ; i++){
				Map<String, Object> bean = slist.get(i);
				listPay.add(bean.get("TOTALPAY")+"");
				listMonth.add(bean.get("PAYDATE")+"");
			}
			logger.info("월별 매출현황 listPay={}, listMonth={}", listPay, listMonth);
			
			model.addAttribute("listPay", listPay);
			model.addAttribute("listMonth", listMonth);
		}
		model.addAttribute("slist", slist);
		
		return "com_manage/company_revenueMonth";
	}
	
	@RequestMapping("/company_revenueDay.do") 
	public String revenueDate(@ModelAttribute DateSearchVO2 dvo, HttpSession session, Model model){
		String companyId = (String)session.getAttribute("comId");
		logger.info("매출 통계 화면 구현, 파라미터 comId={}", companyId);
		dvo.setCompanyId(companyId);
		logger.info("파라미터 year={}, month={}", dvo.getYear(), dvo.getMonth());
		
		List<Map<String, Object>> slist=null;
		List<String> listPay = new ArrayList<String>();
		List<String> listDay = new ArrayList<String>();
		
		if(dvo.getYear()!=null && !dvo.getYear().isEmpty()){
			slist=comService.ComselectSalesByDate(dvo);
			logger.info("##일별 매출 조회 결과는 slist.size()={}", slist.size());
			
			for(int i = 0 ; i < slist.size() ; i++){
				Map<String, Object> bean = slist.get(i);
				listPay.add(bean.get("TOTALPAY")+"");
				
				String _payDate = bean.get("PAYDATE")+"";
				String payDate = _payDate.substring(_payDate.length()-2, _payDate.length());
				listDay.add(payDate);
			}
			
			model.addAttribute("listPay", listPay);
			model.addAttribute("listDay", listDay);
			 
		}
		model.addAttribute("slist", slist);
		
		return "com_manage/company_revenueDay";
	}
}
 