package kr.or.ddit.master.serviceImpl;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.MasterMapper;
import kr.or.ddit.master.service.IMasterService;
import kr.or.ddit.master.vo.SeoVO;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.vo.ReportVO;

@Service
public class MasterServiceImpl implements IMasterService {

	@Inject
	private MasterMapper mapper;
	
	@Override
	public List<MemberVO> list() throws Exception {
		return mapper.list();
	}

	@Override
	public ServiceResult status(String memStatus,String memId) throws Exception {
		ServiceResult result = null;
		int cnt = mapper.status(memStatus,memId);
		if(cnt > 0) {
			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public List<ReportVO> reportList() throws Exception {
		return mapper.reportList();
	}

	@Override
	public List<ReportVO> reportCnt() throws Exception {
		return mapper.reportCnt();
	}

	@Override
	public void insertBlack(String memId) throws Exception {
		mapper.insertBlack(memId);
	}

	@Override
	public void updateBlack1(String memId) throws Exception {
		mapper.updateBlack1(memId);
	}

	@Override
	public String selectOneId(String memId) throws Exception {
		return mapper.selectOneId(memId);
	}

	@Override
	public void updateBlack2(String memId) {
		mapper.updateBlack2(memId);
	}

	@Override
	public ServiceResult reportStatus(int reportId) {
		ServiceResult result = null;
		int cnt = mapper.reportStatus(reportId);
		if(cnt > 0) {
			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public List<ReportVO> reportAllCnt() {
		return mapper.reportAllCnt();
	}

	@Override
	public List<MemberVO> companyList() {
		return mapper.companyList();
	}

	@Override
	public SeoVO selectYearData(int date) {
		// TODO Auto-generated method stub
		return mapper.selectYearData(date);
	}


}
