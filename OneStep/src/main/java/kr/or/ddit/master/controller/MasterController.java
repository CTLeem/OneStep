package kr.or.ddit.master.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.master.service.IMasterService;
import kr.or.ddit.master.vo.SeoVO;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.vo.ReportVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/master")
public class MasterController {

	@Inject
	private IMasterService masterService;
	
	
	// 회원관리 구직자
	@RequestMapping(value = "/member" , method = RequestMethod.GET)
	public String memberList(Model model) throws Exception {
		List<MemberVO> memberList = masterService.list();
		List<ReportVO> reportList = masterService.reportList();
		List<ReportVO> reportCnt = masterService.reportCnt();
		List<ReportVO> reportAllCnt = masterService.reportAllCnt();
		model.addAttribute("list", memberList);
		model.addAttribute("reportList", reportList);
		model.addAttribute("reportCnt", reportCnt);
		model.addAttribute("reportAllCnt", reportAllCnt);
		return "master/masterMember";
	}
		
	// 회원관리 구인자
	@RequestMapping(value = "/company" , method = RequestMethod.GET)
	public String companyList(Model model) throws Exception {
		List<MemberVO> comMemberList = masterService.companyList();
		model.addAttribute("comMemberList",comMemberList);
		return "master/masterCompany";
	}
	
	@ResponseBody
	@RequestMapping(value = "/status" , method = RequestMethod.POST)
	public HashMap<String, Object> memberStatus(String memStatus, String memId, Model model) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		try {
			ServiceResult result = masterService.status(memStatus,memId);
			String blackId = masterService.selectOneId(memId);
			log.info("값확인::"+blackId);
			log.info("값확인::"+memStatus);
			if(result.equals(ServiceResult.OK)) {
				if((blackId == null || blackId == " ")) {
					//insert
					masterService.insertBlack(memId);
				} else if(blackId != null){
					if(memStatus.equals("1")) {
						//update
						masterService.updateBlack1(memId);						
					}else if(memStatus.equals("5")) {
						masterService.updateBlack2(memId);		
					}
				}
				map.put("status", 0);
				map.put("message", "상태 변경에 성공하였습니다.");
			} else {
				map.put("status", 1);
				map.put("message", "상태 변경에 실패하였습니다.");
			}
			
		} catch (Exception e) {
			map.put("status", 2);
			map.put("message", "상태 변경 중 에러가 발생하였습니다.");
		}
		return map;
	}

	@ResponseBody
	@RequestMapping(value = "/reportStatus" , method = RequestMethod.POST)
	public HashMap<String, Object> reportStatus(int reportStatus, int reportId, Model model) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		try {
			ServiceResult result = ServiceResult.FAILED;
			if(reportStatus == 0) {
				result = masterService.reportStatus(reportId);
			}
			if(result.equals(ServiceResult.OK)) {
				map.put("status", 0);
				map.put("message", "상태 변경에 성공하였습니다.");
			} else {
				map.put("status", 1);
				map.put("message", "상태 변경에 실패하였습니다.");
			}
			
		} catch (Exception e) {
			map.put("status", 2);
			map.put("message", "상태 변경 중 에러가 발생하였습니다.");
		}
		return map;
	}
	
	@GetMapping("/chart")
	public String chart () {
		
		LocalDate date = LocalDate.now();
		System.out.println(date.getYear());
		
		
		
		//Map<String, Object> monthMap =  masterService.selectYearData(date.getYear());
		SeoVO test =  masterService.selectYearData(date.getYear());
		
		log.debug("체킁: " + test);
		
		//Integer.parseInt(String.valueOf(dataMap.get("num_val1")))
		//System.out.println(String.valueOf(monthMap.get("D")));
		
		
		return "master/chart";
	}
	
	
	// 회사 승인
	@ResponseBody
	@RequestMapping(value = "/comStatus" , method = RequestMethod.POST)
	public HashMap<String, Object> comStatus(String memStatus, String memId, Model model) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		try {
			ServiceResult result = masterService.status(memStatus,memId);
			log.info("값확인::"+memStatus);
			
			if(result.equals(ServiceResult.OK)) {
				map.put("status", 0);
				map.put("message", "상태 변경에 성공하였습니다.");
			} else {
				map.put("status", 1);
				map.put("message", "상태 변경에 실패하였습니다.");
			}
		} catch (Exception e) {
			map.put("status", 2);
			map.put("message", "상태 변경 중 에러가 발생하였습니다.");
		}
		return map;
	}
	
	/*
	public JsonView memberStatus3(String memStatus, String memId, Model model) throws Exception {

		int status = 0;
		HashMap<String, Object> map = new HashMap<String, Object>();
		try {
			ServiceResult result = masterService.status(memStatus,memId);

			if(result.equals(ServiceResult.OK)) {
				map.put("status", 0);
				map.put("message", "상태 변경에 성공하였습니다.");
			} else {
				map.put("status", 1);
				map.put("message", "상태 변경에 실패하였습니다.");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			map.put("status", 2);
			map.put("message", "상태 변경 중 에러가 발생하였습니다.");
		}
		return JsonView;
	}
	*/
	
//	@RequestMapping(value = "/status" , method = RequestMethod.POST)
//	public String memberStatus(String memStatus, String memId, Model model) throws Exception {
//		String gopage = "";
//		ServiceResult result = masterService.status(memStatus,memId);
//		if(result.equals(ServiceResult.OK)) {
//			gopage = "master/masterMember";
//		}
//		return gopage;
//	}
	
	/*
	public int memberStatus1(String memStatus, String memId, Model model) throws Exception {
		int status = 0;
		ServiceResult result = masterService.status(memStatus,memId);
		if(result.equals(ServiceResult.OK)) {
			status = 0;
		} else {
			status = 1;			
		}
		return status;
	}
	*/
}
