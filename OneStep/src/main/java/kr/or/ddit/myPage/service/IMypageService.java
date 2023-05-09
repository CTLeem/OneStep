package kr.or.ddit.myPage.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.SupportVO;
import kr.or.ddit.myPage.vo.CoverletterItemVO;
import kr.or.ddit.myPage.vo.CoverletterVO;
import kr.or.ddit.myPage.vo.NotificationVO;
import kr.or.ddit.myPage.vo.ResumeVO;
import kr.or.ddit.vo.AnnoVO;
import kr.or.ddit.vo.ApplyVO;
import kr.or.ddit.vo.PaginationInfoVO;
import kr.or.ddit.vo.ProposalVO;

public interface IMypageService {


	public int selectNotificationCount(PaginationInfoVO<NotificationVO> pagingVO);

	public List<NotificationVO> selectNotificationList(PaginationInfoVO<NotificationVO> pagingVO);

	public ServiceResult deleteNotification(int notificationId);

	public int selectResumeCount(PaginationInfoVO<ResumeVO> pagingVO);

	public List<ResumeVO> selectResumeList(PaginationInfoVO<ResumeVO> pagingVO);

	public void insertResume(HttpServletRequest req, ResumeVO resume) throws Exception, IOException;

	public ResumeVO resumeDetail(HttpServletRequest req, int resumeId);

	public void modifyResume(HttpServletRequest req, ResumeVO resume) throws Exception, IllegalStateException, IOException;

	public MemberVO getMemberByResumeId(int resumeId);

	public void deleteResume(HttpServletRequest req, int resumeId);

//	public void insertCovltrItems(HttpServletRequest req, CoverletterItemVO covltrItem);
//
//	public CoverletterItemVO coverletterDetail(HttpServletRequest req, int covltrItemId);
//
//	public void modifyCoverletterItems(HttpServletRequest req, CoverletterItemVO covltrItem);
//
//	public List<CoverletterItemVO> selectCovltrItemList(HttpServletRequest req, String memId);
//
//	public void insertCoverletter(String checkedIds, String covltrTitle);

	public void insertCoverletter(CoverletterVO covltr);

	public CoverletterVO coverletterDetail(HttpServletRequest req, int covltrId);

	public void modifyCoverletter(HttpServletRequest req, CoverletterVO covltr, String memId);

	public void deleteCoverletter(HttpServletRequest req, int covltrId);

	public List<CoverletterVO> selectCoverletterList(HttpServletRequest req, String memId);

	public MemberVO getMemberByCovltrId(int covltrId);

	// 저장된 항목 불러오기
	public List<CoverletterItemVO> getItems();
	  
	// 선택된 항목의 정보 가져오기
	public CoverletterItemVO getItem(int id);

  	// 작성된 커버레터 목록 가져오기
  	public List<CoverletterVO> getCoverletters();
  	
  	public List<ProposalVO> getProposalList(String memId);

	public AnnoVO getAnnoOne(int annoId);

	public void deleteProposal(ProposalVO proVO);

	public List<ApplyVO> getApplyList(String memId);
  	
	public List<AnnoVO> getAnnoCom(int comId);

	public void deleteSupport(SupportVO supVO);
//이력서에 있는 스킬 가져올것
//	public ResumeVO mainResume(String memId);
//이력서 리스트를 5개만 가져올것
	public List<ResumeVO> myResumeList(String memId);
//mypage에서 main에 지원현환을 하기 위해서 쓴다.
	public List<AnnoVO> myApplyList(String memId);



	public List<CoverletterItemVO> getCovltrItemByMemId(String memId);

	public List<CoverletterItemVO> getCovltrItemByCovltrItemIdList(List<Integer> covltrItemIdList);
//mypage에서 좋아요 공고 올리기 
	public List<AnnoVO> mySupList(String memId);
//mypage에서 지원공고 보기
	public List<ApplyVO> getApply(String memId);

	public void updateResumeRepresentative(int resumeId);

}
